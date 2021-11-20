test_that("get file: filename & bin", {
  lorem_ipsum <- filebin_get(basename(PATH), BIN)

  expect_equal(lorem_ipsum, LOREM_IPSUM)
})

test_that("get file: URL", {
  url <- paste0("https://filebin.net/", BIN, "/", basename(PATH))

  lorem_ipsum <- filebin_get(url, file = TXT)

  expect_equal(lorem_ipsum, LOREM_IPSUM)
})
