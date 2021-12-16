#' Upload a file to Filebin
#'
#' @param path Path to a file. If a vector then upload multiple files.
#' @param bin Bin name. If \code{NA} the generate random bin name.
#'
#' @return A tibble.
#' @export
#'
#' @examples
#' \dontrun{
#' # Upload a single file.
#' file_post(LOREM_IPSUM)
#' # Upload multiple files.
#' file_post(c(LOREM_IPSUM, MORE_LOREM_IPSUM))
#'
#' # Upload to a specific bin.
#' bin <- bin_name_random(length = 24)
#' file_post(LOREM_IPSUM, bin)
#' }
file_post <- function(path, bin = NA) {
  if (is.na(bin)) bin <- bin_name_random()
  bin_name_check(bin)

  if (length(path) > 1) {
    map_dfr(path, file_post, bin)
  } else {
    filename <- basename(path)
    url <- file.path(base_url(), bin, filename)

    response <- POST(
      url,
      body = upload_file(path)
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
      stop_response(response)
    }
  }
}
