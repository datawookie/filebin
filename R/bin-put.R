#' Lock a bin on Filebin
#'
#' @inheritParams file_post
#'
#' @return A Boolean.
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
