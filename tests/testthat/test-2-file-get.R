test_that("get file: filename & bin", {
  lorem_ipsum <- file_get(basename(TXT), BIN)

  expect_equal(lorem_ipsum, LOREM_IPSUM)
})

test_that("get file: URL", {
  url <- file.path(BASE_URL, BIN, basename(TXT))

  lorem_ipsum <- file_get(url, overwrite = TRUE)
  # Overwrite with copy just in case something went wrong.
  file.copy(TXT_COPY, TXT)

  expect_equal(lorem_ipsum, LOREM_IPSUM)
})
