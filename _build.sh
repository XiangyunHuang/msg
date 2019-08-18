#!/bin/sh

xvfb-run Rscript --no-save -e "bookdown::render_book(input = 'index.Rmd', output_dir = '_book', config_file = '_bookdown.yml')"
