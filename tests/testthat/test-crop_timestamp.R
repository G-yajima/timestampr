testthat::test_that("Crop Image", {
  # test
  image_path <- system.file("extdata", "02-image.jpg", package = "timestampr")
  image_test <- crop_timestamp(image_path)
  out_test   <- detect_date(image_test)

  # actual
  image_path <- system.file("extdata", "01-cropped-image.jpg", package = "timestampr")
  image_actu <- magick::image_read(image_path)
  out_actu   <- detect_date(image_actu)

  expect_equal(out_actu, out_test)
})
