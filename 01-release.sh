#!/bin/sh -e

test -r .prepared

. vars.inc

OUT=yggdrasil-waash-${version}-i386-v${revision}
R=waash/release
ROUT=$R/$OUT

test -d $ROUT || {
mkdir -p $R
cp -r waash/data $ROUT
mkdir -p $ROUT/deps/bin

sh gen-README.sh > $ROUT/README.txt
mv *.exe $ROUT/deps/bin
mv *.sfx $R
unix2dos $ROUT/*.bat
unix2dos $ROUT/deps/*.txt
}
7z a $R/${OUT}.7z $ROUT

# Make the self-extracting exe file
cat $R/*.sfx > $R/${OUT}.exe
cat $R/${OUT}.7z >> $R/${OUT}.exe
