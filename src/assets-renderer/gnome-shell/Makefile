include ../../Makefile.inc

THEMES_DIR=../../../

.PHONY: build clean

build: $(COLOR_VARIANTS)

$(COLOR_VARIANTS):
	mkdir -p $(foreach VARIANT,Light Dark,$(THEMES_DIR)Dhumavati-$@-$(VARIANT)-GNOME_40/gnome-shell/assets/); \
	mkdir -p $(foreach VARIANT,Light Dark,$(THEMES_DIR)Dhumavati-$@-$(VARIANT)-GNOME_38+36/gnome-shell/assets/); \
	mkdir -p $(foreach VARIANT,Light Dark,$(THEMES_DIR)Dhumavati-$@-$(VARIANT)-FullPanel-GNOME_40/gnome-shell/assets/); \
	mkdir -p $(foreach VARIANT,Light Dark,$(THEMES_DIR)Dhumavati-$@-$(VARIANT)-FullPanel-GNOME_38+36/gnome-shell/assets/); \
	cp assets/* $(THEMES_DIR)Dhumavati-$@-Light-GNOME_40/gnome-shell/assets/
	sed 's/$(DEFAULT_THEME_COLOR)/$(COLOR_$@)/gi' -i $(THEMES_DIR)Dhumavati-$@-Light-GNOME_40/gnome-shell/assets/*
	cp $(THEMES_DIR)Dhumavati-$@-Light-GNOME_40/gnome-shell/assets/* $(THEMES_DIR)Dhumavati-$@-Dark-GNOME_40/gnome-shell/assets/
	$(foreach VARIANT,Light Dark,\
	  cp $(THEMES_DIR)Dhumavati-$@-Light-GNOME_40/gnome-shell/assets/* $(THEMES_DIR)Dhumavati-$@-$(VARIANT)-FullPanel-GNOME_40/gnome-shell/assets/;)
	$(foreach VARIANT,Light Dark,\
	  cp $(THEMES_DIR)Dhumavati-$@-Light-GNOME_40/gnome-shell/assets/* $(THEMES_DIR)Dhumavati-$@-$(VARIANT)-GNOME_38+36/gnome-shell/assets/;)
	$(foreach VARIANT,Light Dark,\
	  cp $(THEMES_DIR)Dhumavati-$@-Light-GNOME_40/gnome-shell/assets/* $(THEMES_DIR)Dhumavati-$@-$(VARIANT)-FullPanel-GNOME_38+36/gnome-shell/assets/;)

clean:
