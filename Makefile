PKGNAME = Dhumavati-gtk
MAINTAINER = Thomas Leon Highbaugh 
PREFIX ?= /usr
THEMES ?= $(patsubst themes/%/,%,$(wildcard themes/*/))

include src/Makefile.inc

all:

build:
	$(MAKE) -C src build

install:
	mkdir -p $(DESTDIR)$(PREFIX)/share/themes
	cp -a $(foreach theme,$(THEMES),themes/$(theme)) $(DESTDIR)$(PREFIX)/share/themes

uninstall:
	-rm -rf $(foreach theme,$(THEMES),$(DESTDIR)$(PREFIX)/share/themes/$(theme))

dist: for color_variant in $(COLOR_VARIANTS); \
	do \
		count_pretty=$$(echo "0$${count}" | tail -c 3); \
		(cd themes && tar -c "Dhumavati-$${color_variant}"*) | \
			xz -z - > "$${count_pretty}-Dhumavati-$${color_variant}_$(VERSION).tar.xz"; \
		count=$$((count+1)); \
	done; \
clean:
	-make -C src clean

.PHONY: all build install uninstall clean
