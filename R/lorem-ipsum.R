# Variables are updated at run time.
#
.onAttach <- function(libname, pkgname) {
  for (filename in c("lorem-ipsum.txt", "more-lorem-ipsum.txt")) {
    varname <- gsub("-", "_", toupper(sub("\\.txt$", "", filename)))
    assign(
      varname,
      system.file(filename, package = "filebin"),
      envir = as.environment("package:filebin")
    )
  }
}

# Dummy values to get around build problems.
#
LOREM_IPSUM <- NULL
MORE_LOREM_IPSUM <- NULL

#' Paths of sample data files
#'
#' @name sample-data-path
#' @export
"LOREM_IPSUM"

#' @rdname sample-data-path
#'
#' @export
"MORE_LOREM_IPSUM"
