all: build

ECLIPSE_ORG=eclipse-SDK-EMFGEF-4.16-macosx-cocoa-x86_64.tgz
BABEL_FILE=BabelLanguagePack-eclipse-ja_4.16.0.v20201010073410_mac.zip
OPENRTP_EN=openrtp-en-2.0.1.tar.gz
OPENRTP_JA=openrtp-ja-2.0.1.tar.gz
APP_DIR=Eclipse.app
EN_APP=OpenRTP2-en.app
JA_APP=OpenRTP2-ja.app
CONFIGDIR=$(APP_DIR)/Contents/Eclipse/configuration
P2DIR=$(APP__DIR)/Contents/Eclipse/p2/org.eclipse.equinox.p2.engine

build:
	./create_openrtp.sh

cleanapp: cleanapp-en cleanapp-ja
cleanapp-ja:
	rm -rf $(APP_DIR)
	ln -s $(JA_APP) $(APP_DIR)
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
	rm $(APP_DIR)

cleanapp-en:
	rm -rf $(APP_DIR)
	ln -s $(EN_APP) $(APP_DIR)
	rm -rf $(APP_DIR)/Contents/MacOS/logback.xml
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
	rm $(APP_DIR)

clean:
	rm -f .DS_store
	rm -rf OpenRTP2.app Eclipse2.app
	rm -rf $(ECLIPSE_ORG)
	rm -rf $(BABEL_FILE) $(OPENRTP_EN) $(OPENRTP_JA)
	rm -rf $(APP_DIR) $(EN_APP) $(JA_APP)
