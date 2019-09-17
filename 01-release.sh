#!/bin/sh -e

test -r .prepared

. vars.inc

OUT=yggdrasil-waash-${version}-i386-r${revision}
R=waash/release
ROUT=$R/$OUT

test -d $ROUT || {
mkdir -p $R
cp -r waash/data $ROUT
mkdir -p $ROUT/deps/bin

unzip UnxUpdates.zip sed.exe
rm UnxUpdates.zip

sh gen-README.sh > $ROUT/README.txt
mv yggdrasil-$version-*.exe $ROUT/deps/bin/yggdrasil-windows-i386.exe
mv *.exe $ROUT/deps/bin
mv *.sfx $R
unix2dos $ROUT/*.bat
unix2dos $ROUT/deps/*.txt
}
cd $R
7z a ${OUT}.7z $OUT

# Make the self-extracting exe file
cat *.sfx > ${OUT}.exe
cat ${OUT}.7z >> ${OUT}.exe
