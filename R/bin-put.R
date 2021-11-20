#' Lock a bin on Filebin
#'
#' @param filename File name or URL.
#' @param file File name to use to save results. If \code{FALSE} then don't save
#'   to file.
#' @param overwrite	Whether to overwrite existing file.
#'
#' @return
#' @export
#'
#' @examples
#' bin_get("placeholder")
bin_lock <- function(bin) {
  if (is.url(bin)) {
    log_debug("Treating bin as an URL.")
    url <- bin
  } else {
    url <- file.path(BASE_URL, bin)
  }

  response <- httr::PUT(
    url,
    accept_json()
  )

  if (status_code(response) == 200) {
    TRUE
  } else {
    log_debug(content(response), ".")
    FALSE
  }
}
