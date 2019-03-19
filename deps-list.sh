#!/bin/sh

. vars.inc

cat <<EOF
https://code.kliu.org/misc/elevate/elevate-1.3.0-redist.7z
https://swupdate.openvpn.org/community/releases/tap-windows-9.9.2_3.exe
https://cdaki.bintray.com/yggdrasil-waash/sed.exe/sed.exe
https://cdaki.bintray.com/yggdrasil-waash/7zCon.sfx
https://700-115685026-gh.circle-artifacts.com/0/yggdrasil-${version}-windows-i386.exe
EOF
