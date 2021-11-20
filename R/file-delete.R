#' Retrieve a file from Filebin
#'
#' @inheritParams file_post
#' @param filename File name or URL.
#'
#' @return A Boolean indicating whether file was successfully deleted.
#' @export
#'
#' @examples
#' file_delete("lorem-ipsum.txt", "placeholder")
#' file_delete("https://filebin.net/placeholder/lorem-ipsum.txt")
file_delete <- function(filename, bin, file = NA, overwrite = FALSE) {
  if (is.url(filename)) {
    log_debug("Treating filename as an URL.")
    url <- filename
  } else {
    url <- file.path(BASE_URL, bin, filename)
  }

  response <- httr::DELETE(url)

  if (status_code(response) == 200) {
    TRUE
  } else {
    log_debug(content(response))
    FALSE
  }
}
