get <- function(filename, bin) {
  url <- file.path(BASE_URL, bin, filename)

  response <- httr::GET(
    url,
    write_disk(filename)
  )
}
