PKGNAME = Dhumavati-gtk
MAINTAINER = Thomas Leon Highbaugh
PREFIX ?= /usr
THEMES ?= $(patsubst %/index.theme,%,$(wildcard */index.theme))

include src/Makefile.inc

all:

build:
	$(MAKE) -C src build

install:
	mkdir -p $(DESTDIR)$(PREFIX)/share/themes
	cp -a $(THEMES) $(DESTDIR)$(PREFIX)/share/themes

uninstall:
	-rm -rf $(foreach theme,$(THEMES),$(DESTDIR)$(PREFIX)/share/themes/$(theme))

_get_version:
	$(eval VERSION ?= $(shell git show -s --format=%cd --date=format:%Y%m%d HEAD))
	@echo $(VERSION)

_get_tag:
	$(eval TAG := $(shell git describe --abbrev=0 --tags))
	@echo $(TAG)

dist: _get_version
	variants="Light Dark"; \
	count=1; \
	for color_variant in $(COLOR_VARIANTS); \
	do \
		for variant in $$variants; \
		do \
			count_pretty=$$(echo "0$${count}" | tail -c 3); \
			tar -c "Dhumavati-$${color_variant}-$${variant}"* | \
				xz -z - > "$${count_pretty}-Dhumavati-$${color_variant}-$${variant}_$(VERSION).tar.xz"; \
			count=$$((count+1)); \
		done; \
	done; \

release: _get_version
	git tag -f $(VERSION)
	git push origin --tags
	$(MAKE) dist


clean:
	-make -C src clean

.PHONY: all build install uninstall _get_version _get_tag clean
