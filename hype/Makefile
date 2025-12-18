#!/usr/bin/make -f

# compile the covers

# requires xelatex


MAKEFLAGS += --no-print-directory
_root_dir := $(shell dirname $(realpath $(firstword $(MAKEFILE_LIST))))
include ../img/Makefile

_src := $(wildcard *.tex)
_obj := $(patsubst %.tex, %.pdf, $(_src))
_img := gladiators2.png

all: $(_img) $(_obj)

.PHONY: clean
clean:
	latexmk -f -C *.pdf
	rm -f $(basename $(_img))*

%.pdf: %.tex ../orly.cls $(_img)
	max_print_line=96 latexmk -xelatex -time -use-make $<

gladiators2.png: gladiators2.tif

gladiators2.tif:
	wget https://etc.usf.edu/clipart/87000/87089/87089_gladiators.tif -O $@
