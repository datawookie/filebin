test_that("get bin: bin", {
  bin <- bin_get(BIN)

  expect_equal(names(bin), c("bin", "files"))
  expect_equal(nrow(bin$bin), 1)
  expect_equal(nrow(bin$files), 2)
})

test_that("get bin: URL", {
  url <- file.path(BASE_URL, BIN)

  bin <- bin_get(url)

  expect_equal(names(bin), c("bin", "files"))
  expect_equal(nrow(bin$bin), 1)
  expect_equal(nrow(bin$files), 2)
})
