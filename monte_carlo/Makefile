#!/usr/bin/make -f

# compile the covers

# requires xelatex


MAKEFLAGS += --no-print-directory

_root_dir := $(shell dirname $(realpath $(firstword $(MAKEFILE_LIST))))
_src := $(wildcard *.tex)
_obj := $(patsubst %.tex, %.pdf, $(_src))


all: $(_obj)

.PHONY: clean
clean:
	latexmk -f -C *.pdf

%.pdf: %.tex ../orly.cls
	max_print_line=96 latexmk -xelatex -time -use-make $<

../img/gaul.tif:
	wget https://etc.usf.edu/clipart/16800/16886/gaultrumpet_16886.tif -O $@

../img/gaul.png: ../img/gaul.tif
	convert ../img/gaul.tif \
		-intensity average -colorspace gray -transparent white -fuzz 25% \
		../img/gaul.png
