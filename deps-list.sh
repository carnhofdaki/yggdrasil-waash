#!/bin/sh

. $PWD/vars.inc

cat <<EOF
https://github.com/carnhofdaki/yggdrasil-waash/releases/download/v0.3.12.0/elevate-1.3.0-redist.7z
https://swupdate.openvpn.org/community/releases/tap-windows-9.9.2_3.exe
http://unxutils.sourceforge.net/UnxUpdates.zip
https://www.7-zip.org/a/7z1900.exe
https://2375-115685026-gh.circle-artifacts.com/0/yggdrasil-0.3.12-windows-i386.exe
EOF
