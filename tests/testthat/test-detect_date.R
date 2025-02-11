testthat::test_that("OCR date loading", {
  image_path <- system.file("extdata", "cliped_image.jpg", package = "timestampr")
  image      <- magick::image_read(image_path)
  out        <- detect_date(image)
  expect_equal(lubridate::mdy_hm("06/22/2018 05:57PM"), out)
})
