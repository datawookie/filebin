#' Delete a bin from Filebin
#'
#' @inheritParams file_post
#'
#' @return A Boolean indicating whether bin was successfully deleted.
#' @export
#'
#' @examples
#' bin_delete("placeholder")
#' bin_delete("https://filebin.net/placeholder/")
bin_delete <- function(bin) {
  if (is.url(bin)) {
    log_debug("Treating bin as an URL.")
    url <- bin
  } else {
    url <- file.path(BASE_URL, bin)
  }

  response <- httr::DELETE(url, accept_json())

  if (status_code(response) == 200) {
    TRUE
  } else {
    log_debug(content(response))
    FALSE
  }
}
