bin_name_random <- function(length = 16, pattern = "[a-z0-9]") {
  stri_rand_strings(1, length, pattern)
}

bin_name_check <- function(bin) {
  if (nchar(bin) < 8) stop("Bin name too short.")
}
