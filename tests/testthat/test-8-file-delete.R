test_that("delete file: filename & bin", {
  expect_true(file_delete(basename(TXT), BIN))
})

test_that("delete file: URL", {
  url <- file.path(BASE_URL, BIN, basename(PNG))
  expect_true(file_delete(url))
})
