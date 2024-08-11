#!/usr/bin/make -f


MAKEFLAGS += --no-print-directory
_root_dir := $(shell dirname $(realpath $(firstword $(MAKEFILE_LIST))))

all:
	make -ik dust_cover.pdf

%.pdf: %.tex
	max_print_line=96 latexmk -xelatex -time -use-make $<

.PHONY: clean
clean:  ## remove temporary files
	latexmk -f -C dust_cover.pdf
