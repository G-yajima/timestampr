#' @title Function to Crop the Timestamp Area from an Image
#' @description ...
#' @param image_path raw image path
#' @export
crop_timestamp <- function(image_path) {
  image  <- imager::load.image(image_path)

  w <- imager::width(image)
  h <- imager::height(image)

  # 右下 1/4 の座標範囲を計算
  xlim_zoom <- c(w * 0.7, w)
  ylim_zoom <- c(0, h - h * 0.7)

  # 画像をプロット（拡大表示）
  plot(xlim_zoom, ylim_zoom, type = "n", xaxs = "i", yaxs = "i")
  rasterImage(image, 0, 0, w, h)

  # マウスでポイントを選択
  points <- locator(n=2)

  crp_cimg  <- imager::imsub(image, x > min(points$x), y > imager::height(image)- max(points$y))
  crp_mgick <- imager::cimg2magick(crp_cimg, rotate = TRUE)
  crp_mgick_floped <- magick::image_flop(crp_mgick)

  return(crp_mgick_floped)
}
