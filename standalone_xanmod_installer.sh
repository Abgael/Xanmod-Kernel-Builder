#!/bin/bash
mkdir xanmod_packages && cd xanmod_packages

# Download check script
wget https://dl.xanmod.org/check_x86-64_psabi.sh
chmod +x "$(basename "https://dl.xanmod.org/check_x86-64_psabi.sh")"
XAN_VER=$(./check_x86-64_psabi.sh | tail -c 2)

# Donwloads Xanmod packages
curl "https://sourceforge.net/projects/xanmod/rss?path=/releases/lts/6.6.64-xanmod1/6.6.64-x64v$XAN_VER-xanmod1" | grep "<link>.*</link>" | sed 's|<link>||;s|</link>||' | while read url; do url=`echo $url | sed 's|/download$||'`; wget $url ; done

# Installs and cleans folder
sudo dpkg -i linux-image-*xanmod*.deb linux-headers-*xanmod*.deb
cd .. && rm -R xanmod_packages
cat /proc/version
#Ref.:https://stackoverflow.com/questions/39668291/download-whole-folder-from-sourceforge
