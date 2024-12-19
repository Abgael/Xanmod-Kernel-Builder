#!/bin/bash
mkdir xanmod_packages && cd xanmod_packages

# Download check script
wget https://dl.xanmod.org/check_x86-64_psabi.sh
chmod +x "$(basename "https://dl.xanmod.org/check_x86-64_psabi.sh")"
XANMOD_VER=$(./check_x86-64_psabi.sh | tail -c 2)

# Choose wich version
read -p "Type 1 for Long-Term Support or 2 for Main: " choice
if  	[[ $choice == 1 ]]; then
	PACKAGE="lts"
elif	[[ $choice == 2 ]]; then
	PACKAGE="main"
else
echo "Invalid choice"
	exit 1
fi

# Fetch the webpage content
CONTENT=$(curl -s "https://sourceforge.net/projects/xanmod/files/releases/$PACKAGE/")

# Extract the folder path for the newest package
LATEST_RELEASE=$(echo "$CONTENT" | grep -oP '(?<=href=")/projects/xanmod/files/releases/'$PACKAGE'/[^"]+/' | head -n 1)

# Extract the last part of the URL and format the output
LAST_PART=$(echo "$LATEST_RELEASE" | grep -oP '[^/]+/$')			# Extract release tag
PREFIX=$(echo "$LAST_PART" | grep -oP '^[0-9]+\.[0-9]+\.[0-9]+')	# Extract release number

# Donwloads Xanmod packages
curl https://sourceforge.net/projects/xanmod/rss?path=/releases/$PACKAGE/$LAST_PART$PREFIX-x64v$XANMOD_VER-xanmod1 | \
grep "<link>.*</link>" | \
sed 's|<link>||;s|</link>||' | \
grep "\.deb/download$" | \
while read url; do 
    url=`echo $url | sed 's|/download$||'`
    wget $url
done
#Ref.:https://stackoverflow.com/questions/39668291/download-whole-folder-from-sourceforge

# Installs and cleans folder
sudo dpkg -i linux-image-*xanmod*.deb linux-headers-*xanmod*.deb
cd .. && rm -R xanmod_packages
cat /proc/version
