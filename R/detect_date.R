#' @title detect date function
#' @description ...
#' @param image clipped image
#' @importFrom tesseract ocr
#' @export
detect_date <- function(image) {
  text_ocr   <- tesseract::ocr(image)
  text_clean <- gsub("\n", "", text_ocr)
  return(text_clean)
}
