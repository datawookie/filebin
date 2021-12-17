skip_on_cran()

test_that("delete bin", {
  skip_on_os("windows")

  expect_true(bin_delete(BIN))
})

test_that("delete bin that doesn't exist", {
  skip_on_os("windows")

  url <- file.path(base_url(), BIN)
  expect_false(bin_delete(url))
})
