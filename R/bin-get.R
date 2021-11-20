#' Retrieve a bin from Filebin
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
bin_get <- function(bin) {
  url <- file.path(BASE_URL, bin)

  response <- httr::GET(
    url,
    accept_json()
  )

  bin <- content(response)

  bin$bin <- as_tibble(bin$bin)
  bin$files <-  bind_rows(bin$files)

  bin
}
