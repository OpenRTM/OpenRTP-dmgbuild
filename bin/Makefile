all: cleanapp modifyapp

PKGFILE=eclipse473-openrtp122v20200828-macosx-cocoa-x86_64.tar.gz
PKGURL=https://openrtm.org/pub/openrtp/packages/1.2.2.v20200828/
APPDIR=OpenRTP2.app
APPDIR_JA=OpenRTP2-ja.app
APPDIR_EN=OpenRTP2-en.app
RESRCDIR=$(APPDIR)/Contents/Resources
INIFILE=$(APPDIR)/Contents/Eclipse/eclipse.ini
PLISTFILE=$(APPDIR)/Contents/Info.plist
CRSRCFILE=$(APPDIR)/Contents/_CodeSignature/CodeResources
CONFIGDIR=$(APPDIR)/Contents/Eclipse/configuration
P2DIR=$(APPDIR)/Contents/Eclipse/p2/org.eclipse.equinox.p2.engine

download:
	wget -c $(PKGURL)/$(PKGFILE)

extract: download $(PKGFILE)
	rm -rf Eclipse.app OpenRTP.app
	tar xvzf $(PKGFILE)
	mv Eclipse.app OpenRTP.app

cleanapp: cleanapp-en cleanapp-en
cleanapp-ja:
	rm -rf $(APPDIR)
	ln -s $(APPDIR_JA) $(APPDIR)
	rm -rf $(APPDIR)/Contents/MacOS/logback.xml
	rm -rf $(CONFIGDIR)/*.log
	rm -rf $(CONFIGDIR)/.settings
	rm -rf $(CONFIGDIR)/org.eclipse.update/history
	rm -rf $(CONFIGDIR)/org.eclipse.core.runtime
	rm -rf $(CONFIGDIR)/org.eclipse.osgi
	rm -rf $(CONFIGDIR)/org.eclipse.ui.intro.universal
	rm -rf $(CONFIGDIR)/org.eclipse.equinox.app
	rm -rf $(CONFIGDIR)/org.eclipse.e4.ui.css.swt.theme
	rm -rf $(P2DIR)/.settings
	rm -rf $(P2DIR)/profileRegistry/SDKProfile.profile/.data/.settings
	rm $(APPDIR)

cleanapp-en:
	rm -rf $(APPDIR)
	ln -s $(APPDIR_EN) $(APPDIR)
	rm -rf $(APPDIR)/Contents/MacOS/logback.xml
	rm -rf $(CONFIGDIR)/*.log
	rm -rf $(CONFIGDIR)/.settings
	rm -rf $(CONFIGDIR)/org.eclipse.update/history
	rm -rf $(CONFIGDIR)/org.eclipse.core.runtime
	rm -rf $(CONFIGDIR)/org.eclipse.osgi
	rm -rf $(CONFIGDIR)/org.eclipse.ui.intro.universal
	rm -rf $(CONFIGDIR)/org.eclipse.equinox.app
	rm -rf $(CONFIGDIR)/org.eclipse.e4.ui.css.swt.theme
	rm -rf $(P2DIR)/.settings
	rm -rf $(P2DIR)/profileRegistry/SDKProfile.profile/.data/.settings
	rm $(APPDIR)

modifyapp: modifyapp-en modifyapp-ja

modifyapp-en:
	rm -f $(APPDIR)
	ln -s $(APPDIR_EN) $(APPDIR)
	# copy icon
	cp ../icons/openrtp.icns $(RESRCDIR)/OpenRTP.icns
	# Modify ini file
	mv $(INIFILE) $(INIFILE).org
	echo "-vm" >> $(INIFILE)
	echo "/Library/Java/JavaVirtualMachines/adoptopenjdk-8.jdk/Contents/Home/bin" >> $(INIFILE)
	echo "-showLocation" >> $(INIFILE)
	cat $(INIFILE).org >>  $(INIFILE)
	rm -f $(INIFILE).org
	# replace icon entry
	sed -i '' 's/Eclipse.icns/OpenRTP.icns/g' $(INIFILE)
	sed -i '' 's/Eclipse.icns/OpenRTP.icns/g' $(PLISTFILE)
	sed -i '' 's/Eclipse.icns/OpenRTP.icns/g' $(CRSRCFILE)
	rm $(APPDIR)

modifyapp-ja:
	rm -f $(APPDIR)
	ln -s $(APPDIR_JA) $(APPDIR)
	# copy icon
	cp ../icons/openrtp.icns $(RESRCDIR)/OpenRTP.icns
	# Modify ini file
	mv $(INIFILE) $(INIFILE).org
	echo "-vm" >> $(INIFILE)
	echo "/Library/Java/JavaVirtualMachines/adoptopenjdk-8.jdk/Contents/Home/bin" >> $(INIFILE)
	echo "-showLocation" >> $(INIFILE)
	cat $(INIFILE).org >>  $(INIFILE)
	rm -f $(INIFILE).org
	# replace icon entry
#	test -f $(INIFILE)   && sed -i '' 's/Eclipse.icns/OpenRTP.icns/g' $(INIFILE)
#	test -f $(PLISTFILE) && sed -i '' 's/Eclipse.icns/OpenRTP.icns/g' $(PLISTFILE)
#	test -f $(CRSRCFILE) && sed -i '' 's/Eclipse.icns/OpenRTP.icns/g' $(CRSRCFILE)
	sed -i '' 's/Eclipse.icns/OpenRTP.icns/g' $(INIFILE)
	sed -i '' 's/Eclipse.icns/OpenRTP.icns/g' $(PLISTFILE)
	sed -i '' 's/Eclipse.icns/OpenRTP.icns/g' $(CRSRCFILE)
	rm $(APPDIR)

clean:
	rm -f .DS_store
	rm -rf OpenRTP2.app Eclipse2.app

cleantgz:
	rm -rf $(PKGFILE)
