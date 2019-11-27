# variables
#
version=$(grep ^https://.*-windows-i386.exe$ deps-list.sh | cut -d/ -f5 | cut -d- -f2)
revision=0
