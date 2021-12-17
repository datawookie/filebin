skip_on_cran()

test_that("get bin: bin", {
  skip_on_os("windows")

  bin <- bin_get(BIN)

  expect_equal(names(bin), c("bin", "files"))
  expect_equal(nrow(bin$bin), 1)
  expect_equal(nrow(bin$files), 2)
})

test_that("get bin: URL", {
  skip_on_os("windows")

  url <- file.path(base_url(), BIN)

  bin <- bin_get(url)

  expect_equal(names(bin), c("bin", "files"))
  expect_equal(nrow(bin$bin), 1)
  expect_equal(nrow(bin$files), 2)
})
