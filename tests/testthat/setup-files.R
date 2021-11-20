library(stringi)
library(httr)

BIN <- bin_name_random()
PNG <- tempfile(fileext = ".png")
TXT <- tempfile(fileext = ".txt")
FILE <- basename(TXT)

SCRATCH <- tempfile(fileext = ".txt")

LOREM_IPSUM <- paste(stringi::stri_rand_lipsum(3), collapse = "\n\n")

# Dump some Lorem Ipsum to TXT.
#
cat(LOREM_IPSUM, file = TXT)

png(PNG)
plot(1:10)
dev.off()
