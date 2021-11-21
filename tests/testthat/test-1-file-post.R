test_that("post file (with bin)", {
  local_lorem_ipsum()

  txtfile <- file_post(TXT, BIN)
  pngfile <- file_post(PNG, BIN)

  expect_type(txtfile, "list")
  expect_equal(txtfile$bin, BIN)
  expect_equal(txtfile$filename, FILE)
})

test_that("post file (without bin)", {
  local_lorem_ipsum()

  txtfile <- file_post(TXT)

  expect_type(txtfile, "list")
  expect_equal(txtfile$filename, FILE)
})

test_that("post multiple files", {
  local_lorem_ipsum()

  files <- file_post(c(TXT, PNG), BIN)

  expect_type(files, "list")
  expect_equal(nrow(files), 2)
})
