#!/bin/sh

Rscript --no-save -e "bookdown::render_book(input = 'index.Rmd', output_dir = '_book', output_format = 'all', config_file = '_bookdown.yml')"
