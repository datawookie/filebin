test_that("create QR code", {
  file <- bin_qr_code(BIN, QRCODE)
  file_type <- system2("file", file, stdout = TRUE)

  expect_true(file.exists(file))
  expect_match(file_type, "PNG")
})
