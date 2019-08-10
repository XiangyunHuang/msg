FROM xiangyunhuang/rcppml:latest

RUN apt-get update \
  && apt-get install -y --no-install-recommends \
## install DBI odbc 
  unixodbc-dev \
  odbc-postgresql \
  libsqliteodbc \
## install webshot
  phantomjs \
## ebook-convert
  calibre \
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
  libx11-dev \
  tk-dev \
  tcl-dev \
  libxpm-dev \
  libxaw7-dev \
  graphviz \
  file \  
  && install2.r --error \
  bookdown \
  cowplot \
  igraph \
  ggforce \
  ggraph \
  ggbeeswarm \
  ggExtra \
  ggfortify \
  ggridges \
  ggthemes \
  ggwordcloud \
  plotrix \
  plot3D \
  plotly \
  scatterplot3d \
  magick \
  odbc \
  extrafont \
  fontcm \
  showtext \
## install spatial packages
  sp \
  maps \
  mapdata \
  mapproj \
  maptools \
  gstat \
  spatialreg \
  spdep \
  sf \
  stars \
  raster \
  satellite \
  leaflet \
  cartography \
  mapview \
  tmap \
  && install2.r --error --repos https://nowosad.github.io/drat/ \
    spDataLarge
  

## Install adobe fonts
RUN mkdir -p /usr/share/fonts/opentype/adobe ~/.fonts \
  && path_prefix="/usr/share/fonts/opentype/adobe" \
  && url_prefix="https://cs.fit.edu/code/projects/ndworld/repository/revisions/11/raw/Resources/Fonts" \
  && wget -q --no-check-certificate $url_prefix/AdobeFangsongStd-Regular.otf -P $path_prefix \
  && wget -q --no-check-certificate $url_prefix/AdobeHeitiStd-Regular.otf -P $path_prefix \
  && wget -q --no-check-certificate $url_prefix/AdobeKaitiStd-Regular.otf -P $path_prefix \
  && wget -q --no-check-certificate $url_prefix/AdobeSongStd-Light.otf -P $path_prefix \
  && fc-cache -fsv \
## Install System fonts for R Graphics  
  && wget -q --no-check-certificate http://simonsoftware.se/other/xkcd.ttf -P ~/.fonts/ \
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
