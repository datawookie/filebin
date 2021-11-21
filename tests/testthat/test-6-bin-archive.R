test_that("delete bin", {
  url <- file.path(BASE_URL, BIN)

  zipfile <- bin_archive(BIN, "zip")
  tarfile <- bin_archive(url, "tar", file = TAR)

  zip_type <- system2("file", zipfile, stdout = TRUE)
  tar_type <- system2("file", tarfile, stdout = TRUE)

  expect_match(zip_type, "Zip archive")
  expect_match(tar_type, "POSIX tar archive")
})
