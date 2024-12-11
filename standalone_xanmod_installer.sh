#!/bin/bash
mkdir xanmod_packages && cd xanmod_packages

# Download check script
wget https://dl.xanmod.org/check_x86-64_psabi.sh
chmod +x "$(basename "https://dl.xanmod.org/check_x86-64_psabi.sh")"
XANMOD_VER=$(./check_x86-64_psabi.sh | tail -c 2)

# Fetch the webpage content
content=$(curl -s "https://sourceforge.net/projects/xanmod/files/releases/lts/")

# Extract the folder path for the newest package
LATEST_RELEASE=$(echo "$content" | grep -oP '(?<=href=")/projects/xanmod/files/releases/lts/[^"]+/' | head -n 1)

# Extract the last part of the URL and format the output

LAST_PART=$(echo "$LATEST_RELEASE" | grep -oP '[^/]+/$')            # Extract release tag
PREFIX=$(echo "$LAST_PART" | grep -oP '^[0-9]+\.[0-9]+\.[0-9]+')    # Extract release number

# Donwloads Xanmod packages
curl "https://sourceforge.net/projects/xanmod/rss?path=/releases/lts/$LAST_PART$PREFIX-x64v$XANMOD_VER-xanmod1" | grep "<link>.*</link>" | sed 's|<link>||;s|</link>||' | while read url; do url=`echo $url | sed 's|/download$||'`; wget $url ; done
#Ref.:https://stackoverflow.com/questions/39668291/download-whole-folder-from-sourceforge

# Installs and cleans folder
sudo dpkg -i linux-image-*xanmod*.deb linux-headers-*xanmod*.deb
cd .. && rm -R xanmod_packages
cat /proc/version
