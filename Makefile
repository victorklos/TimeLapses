# Makefile for generating videos from timelapse series

.PHONY=all

DIRS = $(wildcard */)
VIDEOS=$(DIRS:/=.mp4)

all: $(VIDEOS)

%.mp4:
	@echo "Creating video $@"
	@ffmpeg -f image2 -pattern_type glob -framerate 50 -i '$(basename $@)/*.JPG' -c:v libx264 -pix_fmt yuv420p $@
