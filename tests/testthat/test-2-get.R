test_that("get file: filename & bin", {
  lorem_ipsum <- file_get(basename(PATH), BIN)

  expect_equal(lorem_ipsum, LOREM_IPSUM)
})

test_that("get file: URL", {
  url <- paste0("https://filebin.net/", BIN, "/", basename(PATH))

  lorem_ipsum <- file_get(url, file = SCRATCH)

  expect_equal(lorem_ipsum, LOREM_IPSUM)
})
