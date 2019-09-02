#!/bin/sh

Rscript --no-save -e "bookdown::render_book(input = 'index.Rmd', output_format = 'all', output_dir = '_book', config_file = '_bookdown.yml')"
