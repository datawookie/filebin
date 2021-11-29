# https://filebin.net/xyzl4py0vqo5r5 za/binance-pnp-adverts-20211115-1103.json
#
# https://filebin.net/5v98x8nprxu5fqpu/gpl-3.0.txt

#' @importFrom httr write_disk add_headers upload_file content parse_url
#' @importFrom httr http_status http_error status_code accept_json
#' @importFrom tibble as_tibble
#' @importFrom janitor clean_names
#' @importFrom stringi stri_rand_strings
#' @importFrom logger log_debug
#' @import dplyr
#' @import purrr
#' @import tidyr

cache <- new.env()

#' Set or query API base URL
#'
#' @param url Base URL.
#'
#' @return URL string.
#' @export
#'
#' @examples
#' base_url("https://testnet.binance.vision/")
base_url <- function(url = NULL) {
  if (!is.null(url)) {
    log_debug("Setting base URL to {url}.")
    assign("BASE_URL", url, envir = cache)
  }
  get("BASE_URL", envir = cache)
}

base_url("https://filebin.net")

globalVariables(
  c(
    "bin_id",
    "bytes_readable"
  )
)
