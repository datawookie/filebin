#' Delete a file from Filebin
#'
#' @inheritParams file_post
#' @param filename File name or URL.
#'
#' @return A Boolean indicating whether file was successfully deleted.
#' @export
#'
#' @examples
#' \dontrun{
#' posted <- file_post(LOREM_IPSUM, bin = "latin-text")
#'
#' file_delete("lorem-ipsum.txt", "latin-text")
#' file_delete("https://filebin.net/latin-text/lorem-ipsum.txt")
#' }
file_delete <- function(filename, bin) {
  if (is.url(filename)) {
    log_debug("Treating filename as an URL.")
    url <- filename
  } else {
    url <- file.path(base_url(), bin, filename)
  }

  response <- DELETE(url)

  if (status_code(response) == 200) {
    TRUE
  } else {
    log_debug(content(response))
    FALSE
  }
}
