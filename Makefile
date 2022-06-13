PKGNAME = dhumavati-gtk
MAINTAINER = Thomas Leon Highbaugh <thighbaugh@zoho.com>
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

_get_version:
	$(eval VERSION ?= $(shell git show -s --format=%cd --date=format:%Y%m%d HEAD))
	@echo $(VERSION)

_get_tag:
	$(eval TAG := $(shell git describe --abbrev=0 --tags))
	@echo $(TAG)

dist: _get_version
	count=1; \
	for color_variant in $(COLOR_VARIANTS); \
	do \
		count_pretty=$$(echo "0$${count}" | tail -c 3); \
		(cd themes && tar -c "Dhumavati-$${color_variant}"*) | \
			xz -z - > "$${count_pretty}-Dhumavati-$${color_variant}_$(VERSION).tar.xz"; \
		count=$$((count+1)); \
	done; \

release: _get_version
	$(MAKE) generate_changelog VERSION=$(VERSION)
	git tag -f $(VERSION)
	git push origin --tags
	$(MAKE) dist


generate_changelog: _get_version _get_tag
	git checkout $(TAG) CHANGELOG
	mv CHANGELOG CHANGELOG.old
	echo [$(VERSION)] > CHANGELOG
	printf "%s\n\n" "$$(git log --pretty=format:' * %s' $(TAG)..HEAD)" >> CHANGELOG
	cat CHANGELOG.old >> CHANGELOG
	rm CHANGELOG.old
	$$EDITOR CHANGELOG
	git commit CHANGELOG -m "Update CHANGELOG version $(VERSION)"
	git push origin HEAD

clean:
	-make -C src clean

.PHONY: all build install uninstall _get_version _get_tag clean
