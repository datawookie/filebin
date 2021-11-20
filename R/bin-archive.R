#' Get QR code for bin on Filebin
#'
#' @inheritParams file_post
#' @param format Archive format. Either \code{"zip"} (default) or \code{"tar"}.
#'
#' @return
#' @export
#'
#' @examples
#' bin_archive("placeholder")
bin_archive <- function(bin, format = "zip", file = NA) {
  stopifnot(format %in% c("zip", "tar"))

  url <- file.path(BASE_URL, "archive", bin, format)

  response <- httr::GET(
    url,
    accept_json()
  )

  if (is.na(file)) {
    file <- paste0(bin, ".", format)
  }

  writeBin(content(response, as = "raw"), file)
}
