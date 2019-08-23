# convert pdf to png
to_png <- function(fig_path) {
  png_path <- sub("\\.pdf$", ".png", fig_path)
  magick::image_write(magick::image_read_pdf(fig_path), format = "png", path = png_path)
  return(png_path)
}

library(formatR)

is_latex <- identical(knitr::opts_knit$get("rmarkdown.pandoc.to"), "latex")
is_html <- identical(knitr::opts_knit$get("rmarkdown.pandoc.to"), "html")

knitr::knit_hooks$set(
  optipng = knitr::hook_optipng,
  pdfcrop = knitr::hook_pdfcrop,
  small.mar = function(before, options, envir) {
    if (before) par(mar = c(4, 4, .1, .1), cex.lab = .95, cex.axis = .9, mgp = c(2, .7, 0), tcl = -.3) # smaller margin on top and right
  },
  font.cn = function(before, options, envir) {
    if (before) pdf.options(family = "GB1")
  },
  font.en = function(before, options, envir) {
    if (before) pdf.options(family = "Times")
  }
)

knitr::opts_chunk$set(
  fig.align = "center",
  cache = TRUE,
  small.mar = TRUE,
  fig.showtext = TRUE
)

if (is_latex) {
  knitr::opts_chunk$set(
    out.width = "70%"
  )
}

# https://github.com/XiangyunHuang/MSG-Book/issues/28#issuecomment-522854017
knitr::knit_hooks$set(dev = function(before, options) {
  if (options$dev != 'tikz') return()
  options(device = if (before) tikzDevice::tikz else grDevices::pdf)
  NULL
})
