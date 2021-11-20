test_that("delete bin", {
  expect_true(bin_delete(BIN))
})

test_that("delete bin that doesn't exist", {
  url <- file.path(BASE_URL, BIN)
  expect_false(bin_delete(url))
})
