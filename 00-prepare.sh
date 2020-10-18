#!/bin/sh -e
#
# dependencies:

for dep in wget 7z md5sum stat bc upx jq
do type $dep; done

test -r .prepared-$version || {
. $PWD/vars.inc

test -d tmp || mkdir tmp
sh deps-list.sh | (cd tmp; wget -nc -ci -) || true

test -r tmp/elevate.exe || {
  7z x tmp/elevate-1.3.0-redist.7z bin.x86-32/elevate.exe
  mv bin.x86-32/elevate.exe tmp
  rmdir bin.x86-32
}
md5sum -c <<EOF
7178d69ded53b7683dd52cd1ca0a20ff  tmp/elevate.exe
EOF

test -r tmp/7zCon.sfx || {
  (cd tmp; 7z x 7z1900.exe)
}

upx tmp/yggdrasil-$version-windows-i386.exe

touch .prepared-$version
}
