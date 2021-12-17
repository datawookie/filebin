skip_on_cran()

test_that("lock bin: bin", {
  skip_on_os("windows")

  file_post(TXT, BIN_LOCK)

  expect_true(bin_lock(BIN_LOCK))
  expect_false(file_delete(TXT, BIN_LOCK))
  expect_error(file_post(TXT, BIN_LOCK))
})

test_that("lock bin: URL", {
  skip_on_os("windows")

  url <- file.path(base_url(), bin_name_random())

  expect_false(bin_lock(url))
})
