test_that("post file", {
  binfile <- filebin_post(PATH, BIN)

  expect_type(binfile, "list")
  expect_equal(binfile$bin, BIN)
  expect_equal(binfile$filename, FILE)
})
