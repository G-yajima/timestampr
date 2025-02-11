testthat::test_that("OCR text loading", {
  image_path <- system.file("extdata", "cliped_image.jpg", package = "timestampr")
  image      <- magick::image_read(image_path)
  text       <- detect_date(image)
  expect_match("06/22/2018 05:57PM", text)
})

testthat::test_that("Convert OCR text to datetime", {
  text_PM <- "06/22/2018 04:00PM"
  text_AM <- "06/22/2018 04:00AM"

  expect_equal(lubridate::mdy_hm("06/22/2018 16:00"), lubridate::mdy_hm(text_PM))
  expect_equal(lubridate::mdy_hm("06/22/2018 04:00"), lubridate::mdy_hm(text_AM))
})
