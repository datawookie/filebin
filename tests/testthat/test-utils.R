test_that("bin_name_check() works", {
  expect_error(bin_name_check("xxxxxxx"))
  expect_error(bin_name_check("xxxxxxxx"), NA)
  expect_error(bin_name_check("xxxxxxxxx"), NA)
})
