all: subdirs dmg

DMGNAME=openrtp_v1.2.2.dmg

# subdirs build
SUBDIRS = bin
.PHONY: subdirs $(SUBDIRS)
subdirs: $(SUBDIRS)
$(SUBDIRS):
	$(MAKE) -C $@

backImage.tiff:
	rm -rf backImage.tiff
	tiffutil -cathidpicheck backImage/openrtp_800x400.tif backImage/openrtp_1600x800.tif -out backImage.tiff

dmg: subdirs backImage.tiff
	rm -f $(DMGNAME)
	create-dmg \
		--volname "OpenRTP Installer" \
		--volicon "icons/openrtp.icns" \
		--background "backImage.tiff" \
		--window-pos 200 120 \
		--window-size 800 440 \
		--icon-size 100 \
		--icon "OpenRTP.app" 200 190 \
		--hide-extension "OpenRTP.app" \
		--app-drop-link 600 185 \
		"$(DMGNAME)" \
		"bin/OpenRTP.app/"
	shasum -a 256 $(DMGNAME)

clean:
	rm -f .DS_store
	rm -f backImage.tiff
	rm -f *.dmg
