FROM xiangyunhuang/r-devel:latest

RUN apt-get update \
  && apt-get install -y --no-install-recommends \
## install magick
  libmagick++-dev \
## install rgeos
  libgeos-dev \
## rgl  
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
  gWidgetsRGtk2 \
  hexbin \
  pdftools \
  plotrix \
  plot3D \
  scatterplot3d \
  magick \
  MSG \
  rgeos \
  rgl \
  RColorBrewer \
  showtext \
  sna \
  sp \
  maps \
  mapdata \
  mapproj \
  maptools \
  randomForest \
  rggobi \
  tikzDevice \
  vcd \
  mvtnorm \
  vioplot \
  TeachingDemos \
  aplpack \
  igraph \
  fun \
  latex2exp \
  svglite \
  && installGithub.r \
  yihui/fun \
  yihui/MSG  

RUN apt-get update \
  && apt-get install -y --no-install-recommends \
## install sf
  libudunits2-dev \
  libproj-dev \
  libgdal-dev \
  libavfilter-dev \
  libfftw3-dev \
  cargo

RUN xvfb-run install2.r --error \
  av \
  gifski \
  gganimate \
  ggmap \
  ggraph \
  ggfortify \
  ggridges \
  leaflet \
  plotly \
  raster \
  rayshader \
  RgoogleMaps \
  sf \
  ggbeeswarm \
  ggpointdensity \
  heatmaply \
  quantreg \
  iplots \
  tuneR

## Install TinyTeX
RUN tlmgr install ctex xecjk courier courier-scaled tocbibind subfig savesym \
      colortbl dvipng dvisvgm environ fancyhdr jknapltx listings \
      makecell mathdesign metalogo microtype ms multirow parskip pdfcrop \
      pgf placeins preview psnfss realscripts relsize rsfs setspace soul \
      standalone subfig symbol tabu tex4ht threeparttable threeparttablex \
      titlesec tocbibind tocloft trimspaces ulem varwidth wrapfig xcolor \
      xltxtra zhnumber fandol cancel titlepic mdwtools \
  && apt-get clean all \
  && rm -rf /var/lib/apt/lists/*

EXPOSE 8787 8080 8181 8282

WORKDIR /home/docker/workspace
