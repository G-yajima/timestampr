testthat::test_that("OCR text loading", {
  image <-imager::load.image("inst/extdata/cliped_image.jpg")
  text  <- detect_date(image)
  expect_match("06/22/2018 05:57PM", text)
})
