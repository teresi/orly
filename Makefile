#!/usr/bin/make -f


MAKEFLAGS += --no-print-directory
_root_dir := $(shell dirname $(realpath $(firstword $(MAKEFILE_LIST))))
_input := cover.tex
_output := cover.pdf


.PHONY: pdf
pdf: $(_output)  ## alias for the cookbook


.PHONY: $(_output)
$(_output): $(_input)
	max_print_line=96 \
		latexmk -xelatex -time -use-make $(_cookbook_in)


.PHONY: help
# SEE https://marmelab.com/blog/2016/02/29/auto-documented-makefile.html
help:  ## show usage
	@grep -E '^[a-zA-Z^.(]+:.*?## .*$$' $(MAKEFILE_LIST) | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'


.PHONY: clean
clean:  ## remove temporary files
	latexmk -f -C $(_output)
