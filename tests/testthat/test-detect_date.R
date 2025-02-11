testthat::test_that("OCR text loading", {
  image_path <- system.file("extdata", "cliped_image.jpg", package = "timestampr")
  image      <-imager::load.image(image_path)
  text       <- detect_date(image)
  expect_match("06/22/2018 05:57PM", text)
})
