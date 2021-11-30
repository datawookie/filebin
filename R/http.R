TIMEOUT_SECONDS = 30

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
    # Strip trailing "/".
    url <- sub("/+$", "", url)
    log_debug("Setting base URL to {url}.")
    assign("BASE_URL", url, envir = cache)
  }
  get("BASE_URL", envir = cache)
}

#' GET
#'
#' @noRd
GET <- function(
  url,
  query = list(),
  ...
) {
  httr::GET(
      url,
      query = drop_null(query),
      timeout(TIMEOUT_SECONDS),
      accept_json(),
      ...
  )
}

#' POST
#'
#' @noRd
POST <- function(
  url,
  query = list(),
  body = NULL,
  ...
) {
  log_debug("POST {url}.")

  headers = list(
    "content-type" = "application/octet-stream"
  )
  headers <- do.call(add_headers, headers)

  httr::POST(
    url,
    query = drop_null(query),
    body = body,
    accept_json(),
    timeout(TIMEOUT_SECONDS),
    ...
  )
}

#' DELETE
#'
#' @noRd
DELETE <- function(
  url,
  query = list(),
  ...
) {
  log_debug("DELETE {url}.")

  response <- httr::DELETE(
    url,
    query = drop_null(query),
    accept_json(),
    timeout(TIMEOUT_SECONDS),
    ...
  )
}

#' PUT
#'
#' @noRd
PUT <- function(
  url,
  query = list(),
  ...
) {
  log_debug("PUT {url}.")

  response <- httr::PUT(
    url,
    query = drop_null(query),
    accept_json(),
    timeout(TIMEOUT_SECONDS),
    ...
  )
}
