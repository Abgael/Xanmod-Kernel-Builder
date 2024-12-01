#!/bin/bash

#Download modprobed-db
wget -O modprobed-db.zip https://github.com/graysky2/modprobed-db/archive/refs/heads/master.zip

# Unpack, build and install
unzip modprobed-db.zip && rm -r "$(basename modprobed-db.zip)"
cd modprobed-db*
make -j$(nproc)
sudo make -j$(nproc) install

#
rm -r modprobed-db-master

#
systemctl --user enable modprobed-db
systemctl --user start modprobed-db

#
systemctl --user status modprobed-db
systemctl --user list-timers

# Open Manual
man modprobed-db

