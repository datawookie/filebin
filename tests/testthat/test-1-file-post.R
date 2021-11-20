test_that("post file", {
  txtfile <- file_post(TXT, BIN)
  pngfile <- file_post(PNG, BIN)

  expect_type(txtfile, "list")
  expect_equal(txtfile$bin, BIN)
  expect_equal(txtfile$filename, FILE)
})
