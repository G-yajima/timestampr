#' @title detect date function
#' @description ...
#' @param image clipped image
#' @importFrom tesseract ocr
#' @importFrom lubridate mdy_hm
#' @export
detect_date <- function(image) {
  text_ocr   <- tesseract::ocr(image)
  text_clean <- gsub("\n", "", text_ocr)
  out        <- lubridate::mdy_hm(text_clean)
  return(out)
}
