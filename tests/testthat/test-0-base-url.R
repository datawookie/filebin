skip_on_cran()

test_that("set base URL", {
  original_base_url <- base_url()
  expect_equal(original_base_url, "https://filebin.net")

  base_url <- "https://my-custom-filebin.net"

  expect_equal(base_url(base_url), base_url)
  expect_equal(base_url(), base_url)

  if (LOCAL_FILEBIN) {
    base_url("http://localhost:8080")
  } else {
    base_url(original_base_url)
  }
})
