#' Get QR code for bin on Filebin
#'
#' @inheritParams file_post
#' @inheritParams bin_archive
#'
#' @return File name of the archive.
#' @export
#'
#' @examples
#' bin_get("placeholder")
bin_qr_code <- function(bin, file = NA) {
  url <- file.path(BASE_URL, "qr", bin)

  response <- httr::GET(
    url,
    accept_json()
  )

  if (is.na(file)) {
    file <- paste0(bin, ".png")                                 # nocov
  }

  writeBin(content(response, as = "raw"), file)

  file
}
