#' @title XXX
#' @description ...
#' @param image_path raw image path
#' @importFrom av av_video_info height av_video_images
#' @importFrom graphics rasterImage locator
#' @export
extract_frame <- function(image_path) {
  # image_path <- system.file("extdata", "03-movie.mp4", package = "timestampr")
  info       <- av::av_video_info(image_path)
  N_frame    <- info$video$frames[1]
  trim_frame <- sprintf("start_frame=%d:end_frame=%d", N_frame-11, N_frame-10)
  save_path <- tempdir()
  av::av_video_images(image_path,
                      destdir = tempdir(),
                      format = "jpg",
                      trim = trim_frame)

  return(paste0(save_path, "/", "image_000001.jpg"))
}
