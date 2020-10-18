#!/bin/sh -e

. $PWD/vars.inc
test -r .prepared-$version || {
  echo "Please run ./00-prepare.sh first" >&2
  exit 1
}

OUT=yggdrasil-waash-${version}-i386-r${revision}
R=waash/release
ROUT=$R/$OUT

test -d $ROUT || {
mkdir -p $R
cp -r waash/data $ROUT
mkdir -p $ROUT/deps/bin

(cd tmp; unzip UnxUpdates.zip sed.exe)

sh gen-README.sh > $ROUT/README.txt
cp tmp/yggdrasil-$version-*.exe $ROUT/deps/bin/yggdrasil-windows-i386.exe
cp tmp/tap-*.exe $ROUT/deps/bin
cp tmp/elevate.exe $ROUT/deps/bin
mv tmp/sed.exe $ROUT/deps/bin
unix2dos $ROUT/*.bat
unix2dos $ROUT/deps/*.txt
}
(cd $R; 7z a ${OUT}.7z $OUT)

# Make the self-extracting exe file
cat tmp/7zCon.sfx > $R/${OUT}.exe
cat $R/${OUT}.7z >> $R/${OUT}.exe
