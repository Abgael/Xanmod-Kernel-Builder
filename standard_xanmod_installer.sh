#!/bin/bash

# Register the PGP key:
wget -qO - https://dl.xanmod.org/archive.key | sudo gpg --dearmor -vo /usr/share/keyrings/xanmod-archive-keyring.gpg

# Add the repository:
echo 'deb [signed-by=/usr/share/keyrings/xanmod-archive-keyring.gpg] http://deb.xanmod.org releases main' | sudo tee /etc/apt/sources.list.d/xanmod-release.list

# Download check script
wget https://dl.xanmod.org/check_x86-64_psabi.sh
chmod +x "$(basename "https://dl.xanmod.org/check_x86-64_psabi.sh")"

# Then update and install:
read -p "Type 1 for Long-Term Support or 2 for Main: " choice
if  	[[ $choice == 1 ]]; then
	package="lts-x64v"
elif	[[ $choice == 2 ]]; then
	package="x64v"
else
echo "Invalid choice"
	exit 1
fi

sudo apt update && sudo apt install linux-xanmod-"$package"$(./check_x86-64_psabi.sh | tail -c 2)

#Delete check script
rm check_x86-64_psabi.sh

#Check it
cat /proc/version

echo “Restart is required for changes to take effect.”

