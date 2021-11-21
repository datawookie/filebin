library(stringi)
library(httr)

BIN <- bin_name_random()
BIN_LOCK <- bin_name_random()
PNG <- tempfile(fileext = ".png")
QRCODE <- tempfile(fileext = ".png")
TXT <- tempfile(fileext = ".txt")
TAR <- tempfile(fileext = ".tar")
TXT_COPY <- tempfile(fileext = ".txt")
FILE <- basename(TXT)

SCRATCH <- tempfile(fileext = ".txt")

LOREM_IPSUM <- stri_trim(stri_rand_lipsum(1))

# Dump some Lorem Ipsum to TXT.
#
cat(LOREM_IPSUM, file = TXT)
file.copy(TXT, TXT_COPY)

png(PNG)
plot(1:10)
dev.off()

local_lorem_ipsum <- function(env = parent.frame()) {
  # withr::defer(unlink(TXT), env)
}

withr::defer(
  {
    unlink(
      c(
        basename(TXT),
        PNG,
        SCRATCH,
        LOREM_IPSUM,
        list.files(pattern = "*.zip")
      )
    )
  },
  teardown_env()
)
