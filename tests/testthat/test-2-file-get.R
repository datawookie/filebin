skip_on_cran()

test_that("get file: filename & bin", {
  skip_on_os("windows")

  lorem_ipsum <- file_get(basename(TXT), BIN)

  expect_equal(lorem_ipsum, LOREM_IPSUM)
})

test_that("get file: URL", {
  skip_on_os("windows")

  url <- file.path(base_url(), BIN, basename(TXT))

  lorem_ipsum <- file_get(url, overwrite = TRUE)
  # Overwrite with copy just in case something went wrong.
  file.copy(TXT_COPY, TXT)

  expect_equal(lorem_ipsum, LOREM_IPSUM)
})
