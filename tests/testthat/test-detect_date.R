testthat::test_that("OCR date loading: image", {
  image_path <- system.file("extdata", "01-cropped-image.jpg", package = "timestampr")
  image      <- magick::image_read(image_path)
  out        <- detect_date(image)
  expect_equal(lubridate::mdy_hm("06/22/2018 05:57PM"), out)
})
