#' Retrieve a file from Filebin
#'
#' @inheritParams file_post
#' @param filename File name or URL.
#' @param file File name to use to save results. If \code{FALSE} then don't save
#'   to file.
#' @param overwrite	Whether to overwrite existing file.
#'
#' @return Contents of file.
#' @export
#'
#' @examples
#' \dontrun{
#' posted <- file_post(LOREM_IPSUM, bin = "latin-text")
#'
#' # Discard path and just retain filename.
#' filename <- basename(LOREM_IPSUM)
#' file_get(filename, "latin-text")
#'
#' # Delete downloaded file.
#' file.remove(filename)
#' }
file_get <- function(filename, bin, file = NA, overwrite = FALSE) {
  if (is.url(filename)) {
    log_debug("Treating filename as an URL.")
    url <- filename

    if (is.na(file)) {
      file <- basename(parse_url(url)$path)
    }
  } else {
    url <- file.path(base_url(), bin, filename)

    if (is.na(file)) file <- filename
  }

  # args <- list(url)
  # if (!is.logical(file)) {
  #   args <- c(args, list(write_disk(file, overwrite = overwrite)))
  # }

  response <- GET(
    url
  )

  invisible(content(response))
}
