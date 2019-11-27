#!/bin/sh

URL="https://circleci.com/api/v1.1/project/github/yggdrasil-network/yggdrasil-go/latest/artifacts?branch=master&filter=successful"

NEW=$(wget -q -O - $URL | jq -r .[].url \
  | grep -om1 '^https://.*windows-i386.exe$')

sed -i "s|^https://.*-windows-i386.exe$|$NEW|" deps-list.sh
