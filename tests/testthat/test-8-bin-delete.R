test_that("delete bin", {
  expect_true(bin_delete(BIN))
})

test_that("delete bin that doesn't exist", {
  url <- file.path(base_url(), BIN)
  expect_false(bin_delete(url))
})
