library(stringi)
library(httr)

BIN <- bin_name_random()
PATH <- tempfile(fileext = ".txt")
FILE <- basename(PATH)

SCRATCH <- tempfile(fileext = ".txt")

LOREM_IPSUM <- paste(stringi::stri_rand_lipsum(3), collapse = "\n\n")

# Dump some Lorem Ipsum to the file.
#
cat(LOREM_IPSUM, file = PATH)
