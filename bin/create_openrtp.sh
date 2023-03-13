#!/bin/bash

DOWNLOAD_URL="https://github.com/OpenRTM/OpenRTP_dmg_builder/releases/download/2.0/"
ECLIPSE_ORG="eclipse-SDK-EMFGEF-4.16-macosx-cocoa-x86_64.tgz"
BABEL_FILE="BabelLanguagePack-eclipse-ja_4.16.0.v20201010073410_mac.zip"
OPENRTP_EN="openrtp-en-2.0.1.tar.gz"
OPENRTP_JA="openrtp-ja-2.0.1.tar.gz"
ICON_FILE="../icons/openrtp.icns"

APP_DIR="Eclipse.app"
EN_APP="OpenRTP2-en.app"
JA_APP="OpenRTP2-ja.app"

RESRCDIR=$APP_DIR/Contents/Resources
INIFILE="$APP_DIR/Contents/Eclipse/eclipse.ini"
PLISTFILE="$APP_DIR/Contents/Info.plist"
CRSRCFILE="$APP_DIR/Contents/_CodeSignature/CodeResources"
CONFIGDIR="$APPDIR/Contents/Eclipse/configuration"

delete_wdir()
{
    echo "Deleting Eclipse.app directory."
    rm -rf $APP_DIR
    rm -rf $EN_DIR
    rm -rf $JA_DIR
}

download_eclipse()
{
    echo "Downloading eclipse original package"
    if test -f $ECLIPSE_ORG; then
        echo "$ECLIPSE_ORG already exists"
    else
        wget $DOWNLOAD_URL/$ECLIPSE_ORG
        if test -f $ECLIPSE_ORG; then
            echo "$ECLIPSE_ORG downloaded."
        else
            echo "$ECLIPSE_ORG download failed. Aborting."
            exit 1
        fi
    fi
}

extract_eclipse()
{
    echo "[3] extracting tar ball"
    tar xvzf $ECLIPSE_ORG
    if test -d Eclipse.app; then
        echo "Eclipse.app extracted"
    else
        echo "Eclipse.app not found. Aborting."
        exit 1
    fi
}
#mntdir=`hdiutil mount eclipse-SDK-4.16-macosx-cocoa-x86_64.dmg | awk '/Eclipse/{print $3;}'`
#echo "[2] Copying $mntdir"
#cp -R $mntdir/Eclipse.app .
#hdiutil unmount $mntdir
#echo "[3] $mntdir unmounted."

#echo "[4] Installing EMF/GEF.....it takes several minutes."
#./install_plugins Eclipse.app/Contents/Eclipse

modify_eclipseini()
{
    echo "Modifying eclipse.ini file"
    mv $INIFILE $INIFILE.org
    echo "-vm" >> $INIFILE
    echo "/Library/Java/JavaVirtualMachines/adoptopenjdk-8.jdk/Contents/Home/bin" >> $INIFILE
    echo "-showLocation" >> $INIFILE
    cat $INIFILE.org >>  $INIFILE
    rm -f $INIFILE.org
}

setting_icon()
{
    echo "Replacing icon"
    echo cp $ICON_FILE $RESRCDIR/OpenRTP.icns
    cp $ICON_FILE $RESRCDIR/OpenRTP.icns
    sed -i '' 's/Eclipse.icns/OpenRTP.icns/g' $INIFILE
	sed -i '' 's/Eclipse.icns/OpenRTP.icns/g' $PLISTFILE
	sed -i '' 's/Eclipse.icns/OpenRTP.icns/g' $CRSRCFILE
}

copying_en_ja()
{
    echo "Copying Eclipse.app to OpenRTP2-ja/en.app"
    cp -R $APP_DIR $JA_APP
    cp -R $APP_DIR $EN_APP
    rm -rf $APP_DIR
}

download_babel()
{
    echo "Downloading BabelLanguagePack"
    if test -f $BABEL_FILE; then
        echo "Babel file already exists."
    else
        wget $DOWNLOAD_URL/$BABEL_FILE
        if test -f $BABEL_FILE; then
            echo "$BABEL_FILE downloaded."
        else
            echo "Babel_FILE download failed. Aborting."
            exit 1
        fi
    fi
}

extract_babel()
{
    echo "[6] Extract Babel"
    if test -f $BABEL_FILE; then
        unzip $BABEL_FILE
    else
        echo "$BABEL_FILE not found. Aborting."
    fi
}
#rm BabelLanguagePack-eclipse-ja_4.16.0.v20201010073410_mac.zip

copying_babel()
{
    echo "[7] Copying Babel Plugins"
    cp -R eclipse/features $JA_APP/Contents/Eclipse
    cp -R eclipse/plugins  $JA_APP/Contents/Eclipse
    rm -rf eclipse
}

download_openrtp_en()
{
    echo "Downloading OpenRTP plugins (en)."
    if test -f $OPENRTP_EN; then
        echo "$OPENRTP_EN already exists."
    else
        wget $DOWNLOAD_URL/$OPENRTP_EN
        if test -f $OPENRTP_EN; then
            echo "$OPENRTP_EN downloaded."
        else
            echo "$OPENRTP_EN download failed"
        fi
    fi
}

extract_openrtp_en()
{
    echo "[9] Extracting and copying openrtp plugins" 
    tar xvzf $OPENRTP_EN
    cp -R plugins/* $EN_APP/Contents/Eclipse/plugins/
    rm -R plugins
}

download_openrtp_ja()
{
    echo "[8] Downloading OpenRTP plugins (ja)."
    if test -f $OPENRTP_JA; then
        echo "$OPENRTP_JA already exists."
    else
        wget $DOWNLOAD_URL/$OPENRTP_JA
        if test -f $OPENRTP_JA; then
            echo "$OPENRTP_JA downloaded."
        else
            echo "$OPENRTP_JA download failed"
        fi
    fi
}

extract_openrtp_ja()
{
    echo "[9] Extracting and copying openrtp plugins" 
    tar xvzf $OPENRTP_JA
    cp -R plugins/* $JA_APP/Contents/Eclipse/plugins/
    rm -R plugins
}


delete_wdir

download_eclipse
extract_eclipse
modify_eclipseini

setting_icon

copying_en_ja

download_babel
extract_babel
copying_babel

download_openrtp_en
extract_openrtp_en

download_openrtp_ja
extract_openrtp_ja
