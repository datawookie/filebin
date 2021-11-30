#' Retrieve a bin from Filebin
#'
#' @inheritParams file_post
#'
#' @return A tibble.
#' @export
#'
#' @examples
#' \dontrun{
#' posted <- file_post(LOREM_IPSUM)
#' bin_get(posted$bin)
#' }
bin_get <- function(bin) {
  if (is.url(bin)) {
    log_debug("Treating bin as an URL.")
    url <- bin
  } else {
    url <- file.path(base_url(), bin)
  }

  response <- GET(url)

  bin <- content(response)

  bin$bin <- as_tibble(bin$bin) %>%
    drop_cruft()
  bin$files <-  bind_rows(bin$files) %>%
    drop_cruft()

  bin
}
