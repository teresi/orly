#!/usr/bin/make -f

# compile the covers

# requires xelatex


MAKEFLAGS += --no-print-directory

_root_dir := $(shell dirname $(realpath $(firstword $(MAKEFILE_LIST))))
_src := $(wildcard *.tex)
_obj := $(patsubst %.tex, %.pdf, $(_src))


all: $(_obj)


%.pdf: %.tex ../orly.cls
	max_print_line=96 latexmk -xelatex -time -use-make $<


.PHONY: clean
clean:
	latexmk -f -C *.pdf
