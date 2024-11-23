#!/usr/bin/make -f

# download / convert images

# REQUIRES
#	ImageMagick
#	wget

# SEE
#	https://www.oldbookillustrations.com/
#	https://etc.usf.edu/clipart/


MAKEFLAGS += --no-print-directory
IMG_MAGICK_FLAGS += -intensity average -colorspace gray -fuzz 25% -transparent white
_root_dir := $(shell dirname $(realpath $(firstword $(MAKEFILE_LIST))))

SRC := src
TIF := gaul.tif vipers.tif
PNG := $(patsubst %.tif,%.png,$(TIF))


all: $(PNG)

clean:
	rm -rf $(TIF)
	rm -rf $(PNG)

$(PNG): $(TIF)

%.png: %.tif
	convert $< $(IMG_MAGICK_FLAGS) $@

vipers.tif:
	wget https://etc.usf.edu/clipart/15200/15282/vipers_15282.tif -O $@

gaul.tif:
	wget https://etc.usf.edu/clipart/16800/16886/gaultrumpet_16886.tif -O $@
