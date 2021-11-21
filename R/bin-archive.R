#' Get contents of bin as archive
#'
#' @inheritParams file_post
#' @param format Archive format. Either \code{"zip"} (default) or \code{"tar"}.
#' @param file File name to use to save results.
#'
#' @return File name as character vector.
#' @export
#'
#' @examples
#' bin_archive("placeholder", file = tempfile(fileext = ".zip"))
bin_archive <- function(bin, format = "zip", file = NA) {
  stopifnot(format %in% c("zip", "tar"))

  if (is.url(bin)) {
    bin <- sub("/.*$", "", parse_url(bin)$path)
  }

  url <- file.path(BASE_URL, "archive", bin, format)

  response <- httr::GET(
    url,
    accept_json()
  )

  if (is.na(file)) {
    file <- paste0(bin, ".", format)
  }

  writeBin(content(response, as = "raw"), file)

  file
}
