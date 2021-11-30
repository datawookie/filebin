#' Lock a bin on Filebin
#'
#' @inheritParams file_post
#'
#' @return A Boolean.
#' @export
#'
#' @examples
#' \dontrun{
#' posted <- file_post(LOREM_IPSUM)
#' bin_get(posted$bin)
#' }
bin_lock <- function(bin) {
  if (is.url(bin)) {
    log_debug("Treating bin as an URL.")
    url <- bin
  } else {
    url <- file.path(base_url(), bin)
  }

  response <- PUT(url)

  if (status_code(response) == 200) {
    TRUE
  } else {
    log_debug(content(response), ".")
    FALSE
  }
}
