FROM xiangyunhuang/r-devel:latest

RUN apt-get update \
  && apt-get install -y --no-install-recommends \
## install webshot
  phantomjs \
## install magick
  libmagick++-dev \
## install sf
  libudunits2-dev \
  libproj-dev \
  libgeos-dev \
  libgdal-dev \
## rgl  
  libcgal-dev \ 
  libglu1-mesa-dev \ 
  libpoppler-cpp-dev \
  graphviz \
  ggobi \
  libgtk2.0-dev

RUN xvfb-run install2.r --error \
  animation \
  alphahull \
  bookdown \
  cowplot \
  corrplot \
  formatR \
  GGally \
  ggbeeswarm \
  ggExtra \
  ggridges \
  ggthemes \
  ggwordcloud \
  gWidgetsRGtk2 \
  pdftools \
  plotrix \
  plot3D \
  scatterplot3d \
  magick \
  MSG \
  rgeos \
  rgl \
  RColorBrewer \
  extrafont \
  fontcm \
  showtext \
  sna \
  sp \
  maps \
  mapdata \
  mapproj \
  maptools \
  sf \
  raster \
  randomForest \
  rggobi \
  tikzDevice \
  vcd \
  mvtnorm \
  vioplot \
  TeachingDemos \
  aplpack

RUN install2.r --error \
  igraph \
  fun \
  latex2exp \
  svglite

RUN wget -q --no-check-certificate http://simonsoftware.se/other/xkcd.ttf -P ~/.fonts/ \
  && Rscript -e "extrafont::font_import(paths = '~/.fonts', pattern = '[X/x]kcd', prompt = FALSE)" \
  && Rscript -e "extrafont::font_import(prompt = FALSE)" \
  && Rscript -e "extrafont::font_install('fontcm', prompt = FALSE)" \
  && Rscript -e "library(showtext);font_install(source_han_serif());font_install(source_han_sans())" \
## Install TinyTeX
  && tlmgr install ctex xecjk courier courier-scaled tocbibind subfig savesym \
      colortbl dvipng dvisvgm environ fancyhdr jknapltx listings \
      makecell mathdesign metalogo microtype ms multirow parskip pdfcrop \
      pgf placeins preview psnfss realscripts relsize rsfs setspace soul \
      standalone subfig symbol tabu tex4ht threeparttable threeparttablex \
      titlesec tocbibind tocloft trimspaces ulem varwidth wrapfig xcolor xltxtra zhnumber \
  && apt-get clean all \
  && rm -rf /var/lib/apt/lists/*

EXPOSE 8787 8080 8181 8282

WORKDIR /home/docker/workspace
