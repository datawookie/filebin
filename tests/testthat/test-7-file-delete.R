skip_on_cran()

test_that("delete file: filename & bin", {
  skip_on_os("windows")

  expect_true(file_delete(basename(TXT), BIN))
})

test_that("delete file: URL", {
  skip_on_os("windows")

  url <- file.path(base_url(), BIN, basename(PNG))
  expect_true(file_delete(url))
})

test_that("delete file that doesn't exist", {
  skip_on_os("windows")

  expect_false(file_delete(bin_name_random(), bin_name_random()))
})
