# https://filebin.net/xyzl4py0vqo5r5 za/binance-pnp-adverts-20211115-1103.json
#
# https://filebin.net/5v98x8nprxu5fqpu/gpl-3.0.txt

#' @importFrom httr write_disk add_headers upload_file content parse_url status_code
#' @importFrom tibble as_tibble
#' @importFrom janitor clean_names
#' @importFrom stringi stri_rand_strings
#' @importFrom logger log_debug
#' @import dplyr
#' @import purrr
#' @import tidyr

BASE_URL <- "https://filebin.net"

globalVariables(
  c(
    "bin_id",
    "bytes_readable"
  )
)
