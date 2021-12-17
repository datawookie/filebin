library(stringi)

# Check for local instance of Filebin.
#
if (require(stevedore)) {
  message("Found {stevedore}.")

  message("Creating Docker client.")
  docker <- tryCatch(
    stevedore::docker_client(quiet = TRUE),
    error = function(e) NULL
  )

  if (is.null(docker)) {
    warning("Failed!")
    LOCAL_FILEBIN <- FALSE
  } else {
    message("Done.")

    message("Getting list of Docker containers.")
    container_names <- unlist(docker$container$list()$names)

    message("Checking for local Filebin instance.")
    LOCAL_FILEBIN <- any(grepl("^filebin2", container_names))

    if (LOCAL_FILEBIN) {
      message("Found local Filebin instance.")
    } else {
      message("Did not find local Filebin instance.")
    }
  }
} else {
  message("Didn't find {stevedore}.")
  LOCAL_FILEBIN <- FALSE
}

LOCAL_FILEBIN <- FALSE

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
