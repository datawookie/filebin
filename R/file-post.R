#' Upload a file to Filebin
#'
#' @param path Path to a file. If a vector then upload multiple files.
#' @param bin Bin name. If \code{NA} the generate random bin name.
#'
#' @return A tibble.
#' @export
#'
#' @examples
#' # Create some sample data.
#' library(stringi)
#'
#' lorem_ipsum <- tempfile(fileext = ".txt")
#' ipsum_lorem <- tempfile(fileext = ".txt")
#'
#' cat(stri_rand_lipsum(3), sep = "\n\n", file = lorem_ipsum)
#' cat(stri_rand_lipsum(7), sep = "\n\n", file = ipsum_lorem)
#'
#' # Upload a single file.
#' file_post(lorem_ipsum)
#' # Upload multiple files.
#' file_post(c(lorem_ipsum, ipsum_lorem))
#'
#' # Upload to a specific bin.
#' bin <- bin_name_random()
#' file_post(lorem_ipsum, bin)
#'
#' # To get details of the HTTP request.
#' httr::with_verbose(file_post(lorem_ipsum))
file_post <- function(path, bin = NA) {
  if (is.na(bin)) bin <- bin_name_random()
  bin_name_check(bin)

  if (length(path) > 1) {
    map_dfr(path, file_post, bin)
  } else {
    filename <- basename(path)
    url <- file.path(BASE_URL, bin, filename)

    headers = list(
      "content-type" = "application/octet-stream"
    )
    headers <- do.call(add_headers, headers)

    response <- httr::POST(
      url,
      headers,
      body = upload_file(path),
      accept_json()
    )

    if (status_code(response) == 201) {
      content(response) %>%
        # Convert nested lists to tibbles.
        lapply(function(x) {clean_names(as_tibble(x))}) %>%
        # Convert list to tibble.
        lapply(list) %>%
        as_tibble() %>%
        mutate(url = url) %>%
        unnest(bin, names_sep = "_") %>%
        unnest(file) %>%
        select(
          url,
          bin = bin_id,
          filename,
          everything()) %>%
        drop_cruft()
    } else {
      stop(paste0(content(response), "."))
    }
  }
}
