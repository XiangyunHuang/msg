# convert pdf to png
to_png <- function(fig_path) {
  png_path <- sub("\\.pdf$", ".png", fig_path)
  magick::image_write(magick::image_read_pdf(fig_path), format = "png", path = png_path)
  return(png_path)
}

is_latex <- identical(knitr::opts_knit$get("rmarkdown.pandoc.to"), "latex")
is_html <- identical(knitr::opts_knit$get("rmarkdown.pandoc.to"), "html")
