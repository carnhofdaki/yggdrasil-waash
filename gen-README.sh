#!/bin/sh

. vars.inc

unix2dos <<EOF
Yggdrasil-waash
===============

Usage: Run \`000-RUNME.bat\`

This is a simple way to run Yggdrasil on a Windows machine.
It generates a new configuration file and adds a predefinet
set of Peers (found in \`deps/peers.txt\` file) into it.

Contents of the archive:
\`\`\`
C:\>tree /F yggdrasil-waash-${version}-i386-v${revision}
Folder PATH listing for volume Windows
Volume serial number is FFFF-FFFF
C:\YGGDRASIL-WAASH-${version}-I386-V${revision}
│   000-RUNME.bat
│   README.txt
│   script.bat
│
└───deps
    │   logo.txt
    │   peers.txt
    │
    └───bin
            elevate.exe
            sed.exe
            tap-windows-9.9.2_3.exe
            yggdrasil-${version}-windows-i386.exe

\`\`\`

NOTES
-----

The sed.exe binary comes from http://unxutils.sourceforge.net/
Yggdrasil binary is compressed using UPX https://upx.github.io/

https://stackoverflow.com/questions/7044985/how-can-i-auto-elevate-my-batch-file-so-that-it-requests-from-uac-administrator
https://stackoverflow.com/questions/6811372/how-to-code-a-bat-file-to-always-run-as-admin-mode
https://superuser.com/questions/946105/is-it-possible-to-install-tap-windows-virtual-openvpn-network-driver-in-a-comple

Not used, just for completness:
https://stackoverflow.com/questions/12322308/batch-file-to-check-64bit-or-32bit-os
https://msfn.org/board/topic/129674-how-can-i-identify-if-os-is-32-bit-or-64-bit-in-batch-file/
EOF
