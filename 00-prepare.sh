#!/bin/sh -e
#
# dependencies:

for dep in wget 7z md5sum stat bc upx
do type $dep; done

test -r .prepared || {
. vars.inc

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

SIZE=$(stat -c "%b*%B" yggdrasil-0.3.5-windows-i386.exe | bc)
test $SIZE -lt 1824704 || upx yggdrasil-0.3.5-windows-i386.exe

touch .prepared
}
