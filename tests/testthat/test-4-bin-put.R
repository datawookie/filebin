test_that("lock bin: bin", {
  local_lorem_ipsum()

  file_post(TXT, BIN_LOCK)

  expect_true(bin_lock(BIN_LOCK))
  expect_false(file_delete(TXT, BIN_LOCK))
})

test_that("lock bin: URL", {
  url <- file.path(BASE_URL, bin_name_random())

  expect_false(bin_lock(url))
})
