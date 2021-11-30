#' @importFrom httr write_disk add_headers upload_file content parse_url
#' @importFrom httr http_status http_error status_code accept_json timeout
#' @importFrom tibble as_tibble
#' @importFrom janitor clean_names
#' @importFrom stringi stri_rand_strings
#' @importFrom logger log_debug
#' @import dplyr
#' @import purrr
#' @import tidyr

cache <- new.env()

.onLoad <- function(libname, pkgname){
  base_url("https://filebin.net")
}

globalVariables(
  c(
    "bin_id",
    "bytes_readable"
  )
)
