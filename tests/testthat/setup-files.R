library(stringi)

BIN <- bin_name_random()
PATH <- tempfile(fileext = ".txt")
FILE <- basename(PATH)

# Dump some Lorem Ipsum to the file.
#
cat(stringi::stri_rand_lipsum(3), sep = "\n\n", file = PATH)
