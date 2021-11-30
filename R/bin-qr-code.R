#' Get QR code for bin on Filebin
#'
#' @inheritParams file_post
#' @inheritParams bin_archive
#'
#' @return File name of the archive.
#' @export
#'
#' @examples
#' \dontrun{
#' posted <- file_post(LOREM_IPSUM, bin = "latin-text")
#' bin_qr_code("latin-text", file = tempfile(fileext = ".png"))
#' }
bin_qr_code <- function(bin, file = NA) {
  url <- file.path(base_url(), "qr", bin)

  response <- GET(url)

  if (is.na(file)) {
    file <- paste0(bin, ".png")                                 # nocov
  }

  writeBin(content(response, as = "raw"), file)

  file
}
