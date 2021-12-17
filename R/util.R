#' Create random bin name for Filebin
#'
#' @param length Number of characters in bin name. Must be 8 or more.
#' @param pattern Character set.
#'
#' @return A character vector.
#' @export
#'
#' @examples
#' bin_name_random(8)
bin_name_random <- function(length = 16, pattern = "[a-z0-9]") {
  stri_rand_strings(1, length, pattern)
}

bin_name_check <- function(bin) {
  if (nchar(bin) < 8) stop("Bin name too short.")
}

http_check_status <- function(response) {                       # nocov start
  if (http_error(response)) {
    stop(http_status(response)$reason, call. = FALSE)
  }
}                                                               # nocov end

is.url <- function(x) {
  grepl("https?://", x, ignore.case = TRUE)
}

drop_cruft <- function(.data) {
  .data %>%
    select(
      -starts_with("bin_"),
      -ends_with("_at_relative"),
      -bytes_readable
    ) %>%
    clean_names() %>%
    rename_at(vars(ends_with("_at")), ~ sub("_at$", "", .))
}

drop_null <- function(x) {
  if (length(x)) {
    x[!sapply(x, is.null)]
  } else {
    x
  }
}

stop_response <- function(response) {
  stop(paste0(sub("\n$", "", content(response)), "."), call. = FALSE)
}
