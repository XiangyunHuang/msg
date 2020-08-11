# Before buiding the book ----

## install R packages ----
pkgs <- c(
  "alphahull", "animation", "aplpack",
  "beginr", "bookdown",
  "corrplot", "cowplot", "formatR", "fun",
  "GGally", "gganimate", "ggplot2", "gridGraphics","ggpointdensity",
  "heatmaply", "hexbin", "HistData", "htmlwidgets",
  "igraph", "iplots",
  "kableExtra", "KernSmooth",
  "leaflet",
  "Matrix", "magick", "maps", "maptools", "metR", "MSG", "mvtnorm",
  "ncovr",
  "openair",
  "patchwork",
  "pdftools", "plot3D", "plotrix",
  "quantreg", "qqplotr",
  "randomForest", "rgeos", "rggobi", "rgl", "RColorBrewer", "rpart", "Rmisc",
  "scatterplot3d", "showtext", "sna", "sp", "survminer", "svglite", "survival", "sm",
  "TeachingDemos", "tikzDevice", "tuneR", "vcd", "vioplot"
)
lapply(pkgs, function(pkg) {
  if (system.file(package = pkg) == "") install.packages(pkg)
})

pkgs_github <-  c("ropensci/rnaturalearthhires", "GuangchuangYu/nCov2019")
lapply(pkgs_github, function(pkg) {
  if (system.file(package = basename(pkg)) == "") remotes::install_github(pkg)
})

## Create bibliography for packages ----
pkgs <- pkgs[!pkgs %in% c("animation", "ggplot2", "igraph", "scatterplot3d")]

bib <- knitr::write_bib(
  x = c(.packages(),pkgs),
  file = NULL, prefix = ""
)
bib <- unlist(bib)
# remove the ugly single quotes required by CRAN policy
bib <- gsub("(\\\n)", " ", bib)
bib <- gsub("'(Htmlwidgets|iframes|TeX Live|LaTeX|ggplot2|plotly|Leaflet|GGobi)'", "\\1", bib)
xfun::write_utf8(bib, "bib/MSG-packages.bib")

## temporary files
sink(file="temp/Stem-islands.txt")
stem(islands)
sink()
set.seed(717)
x <- rpois(80, lambda = 10)
sink(file="temp/Stem-poisson.txt")
stem(x, scale = 2)
sink()



# After buiding the book ----
## Remove intermediant files ----
file.remove(c('_main-tikzDictionary',
              'axis-demo-1.aux', 'gradArrows-1.aux',
              '_main.log', '.Rhistory'))

## convert "<-" into "=", "if()" into "if ()", "for()" into "for ()" ----
path <- "d:/temp/rmd/"

filename <- list.files(path, full.names = TRUE)

for (i in filename) {
  # i <- filename[1]
  txt <- readLines(i, encoding = "UTF-8")
  txt <- gsub("<-", "=", txt)
  txt <- gsub("if(", "if (", txt, fixed = TRUE)
  txt <- gsub("for(", "for (", txt, fixed = TRUE)
  writeLines(txt, i, useBytes = TRUE)
}

## find all data() function and library() function
path <- "d:/Seafile/pz/doing/rpkg/msg/inst/examples/"
filename <- list.files(path, full.names = TRUE)
i <- filename[1]
out_data <- sapply(filename, function(i) {
  txt <- readLines(i, encoding = "UTF-8")
  if (any(grepl("data(", txt, fixed = TRUE))){
    txt_data <- grep("data(", txt, value = TRUE, fixed = TRUE)
    return(paste(basename(i), txt_data, sep = "\n"))
  }
}
)
out_data <- out_data[!sapply(out_data, is.null)]
writeLines(unlist(out_data), "_R/alldata.R")
