#!/bin/sh -e
#
# dependencies:

for dep in wget 7z md5sum stat bc upx
do type $dep; done

test -r .prepared || {
. $PWD/vars.inc

sh deps-list.sh | wget -nc -ci - || true

test -r elevate.exe || {
  7z x elevate-1.3.0-redist.7z bin.x86-32/elevate.exe
  mv bin.x86-32/elevate.exe ./
  rmdir bin.x86-32
}
md5sum -c <<EOF
7178d69ded53b7683dd52cd1ca0a20ff  elevate.exe
EOF
rm -f elevate-1.3.0-redist.7z

test -r 7zCon.sfx || {
  mkdir tmp
  cd tmp
  7z x ../7z1900.exe
  mv 7zCon.sfx ..
  cd ..
  rm -rf tmp
}
rm -f 7z1900.exe

SIZE=$(stat -c "%b*%B" yggdrasil-$version-windows-i386.exe | bc)
test $SIZE -lt 1824704 || upx yggdrasil-$version-windows-i386.exe

touch .prepared
}
