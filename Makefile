DMG_JA=openrtp2-ja_v2.0.0.dmg
DMG_EN=openrtp2-en_v2.0.0.dmg
APP_JA=OpenRTP2-ja.app
APP_EN=OpenRTP2-en.app

all: subdirs $(DMG_EN) $(DMG_JA)

# subdirs build
SUBDIRS = icons backImage
.PHONY: subdirs $(SUBDIRS)
subdirs: $(SUBDIRS)
$(SUBDIRS):
	$(MAKE) -C $@

$(DMG_EN): subdirs backImage.tiff
	create-dmg --hdiutil-verbose \
		--volname "OpenRTP2-en Installer" \
		--volicon "icons/openrtp.icns" \
		--background "backImage/backImage.tiff" \
		--window-pos 200 120 \
		--window-size 800 440 \
		--icon-size 100 \
		--icon "$(APP_EN)" 200 190 \
		--hide-extension "$(APP_EN)" \
		--app-drop-link 600 185 \
		"$(DMG_EN)" \
		"bin/$(APP_EN)/"
	shasum -a 256 $(DMG_EN)

$(DMG_JA): subdirs backImage.tiff
	create-dmg --hdiutil-verbose \
		--volname "OpenRTP2-ja Installer" \
		--volicon "icons/openrtp.icns" \
		--background "backImage/backImage.tiff" \
		--window-pos 200 120 \
		--window-size 800 440 \
		--icon-size 100 \
		--icon "$(APP_JA)" 200 190 \
		--hide-extension "$(APP_JA)" \
		--app-drop-link 600 185 \
		"$(DMG_JP)" \
		"bin/$(APP_JA)/"
	shasum -a 256 $(DMG_JP)


clean:
	rm -f .DS_store
	rm -f *.dmg
