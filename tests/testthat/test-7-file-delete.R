test_that("delete file: filename & bin", {
  expect_true(file_delete(basename(TXT), BIN))
})

test_that("delete file: URL", {
  url <- file.path(base_url(), BIN, basename(PNG))
  expect_true(file_delete(url))
})

test_that("delete file that doesn't exist", {
  expect_false(file_delete(bin_name_random(), bin_name_random()))
})
