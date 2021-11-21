#' Retrieve a bin from Filebin
#'
#' @inheritParams file_post
#'
#' @return A tibble.
#' @export
#'
#' @examples
#' bin_get("placeholder")
bin_get <- function(bin) {
  if (is.url(bin)) {
    log_debug("Treating bin as an URL.")
    url <- bin
  } else {
    url <- file.path(BASE_URL, bin)
  }

  response <- httr::GET(
    url,
    accept_json()
  )

  bin <- content(response)

  bin$bin <- as_tibble(bin$bin)
  bin$files <-  bind_rows(bin$files)

  bin
}
