#!/usr/bin/env -S make -f

MAKEFLAGS += --no-print-directory

.PHONY: all
all: $(_cookbook_out)  ## the cookbook


.PHONY: install
install: SHELL:=/usr/bin/env bash
install:               ## install LaTeX dependencies w/ tlmgr
	tlmgr install $$(<requirements.txt)
