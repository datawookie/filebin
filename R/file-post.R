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
#' cat(stri_rand_lipsum(3), sep = "\n\n", file = "lorem-ipsum.txt")
#' cat(stri_rand_lipsum(7), sep = "\n\n", file = "ipsum-lorem.txt")
#'
#' # Upload a single file.
#' post("lorem-ipsum.txt")
#' # Upload multiple files.
#' post(c("lorem-ipsum.txt", "ipsum-lorem.txt"))
#' # Upload to a specific bin.
#' post("lorem-ipsum.txt", "placeholder")
#'
#' # To get details of the HTTP request.
#' httr::with_verbose(post("lorem-ipsum.txt"))
post <- function(path, bin = NA) {
  if (is.na(bin)) bin <- bin_name_random()
  bin_name_check(bin)

  if (length(path) > 1) {
    map_dfr(path, post, bin)
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
      body = upload_file(path)
    )

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
      select(
        -starts_with("bin_"),
        -ends_with("_at_relative"),
        -bytes_readable
      ) %>%
      rename_at(vars(ends_with("_at")), ~ sub("_at$", "", .))
  }
}
