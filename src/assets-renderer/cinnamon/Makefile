include ../../Makefile.inc

THEMES_DIR=../../../themes/

.PHONY: build clean

build: $(COLOR_VARIANTS)

$(COLOR_VARIANTS):
	mkdir -p $(THEMES_DIR)Dhumavati-$@-Light/cinnamon/assets/
	mkdir -p $(THEMES_DIR)Dhumavati-$@-Dark/cinnamon/assets/
	cp assets/* $(THEMES_DIR)Dhumavati-$@-Light/cinnamon/assets/
	sed 's/$(DEFAULT_THEME_COLOR)/$(COLOR_$@)/gi' -i $(THEMES_DIR)Dhumavati-$@-Light/cinnamon/assets/*
	cp $(THEMES_DIR)Dhumavati-$@-Light/cinnamon/assets/* $(THEMES_DIR)Dhumavati-$@-Dark/cinnamon/assets/

clean:
