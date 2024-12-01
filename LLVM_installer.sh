#!/bin/bash

sudo su
apt purge gcc llvm ld.lld
apt update

#bash -c "$(wget -O - https://apt.llvm.org/llvm.sh)"

update-alternatives --install /usr/bin/llvm-objdump llvm-objdump $(which llvm-objdump-18) 180
update-alternatives --install /usr/bin/llvm-objcopy llvm-objcopy $(which llvm-objcopy-18) 180
update-alternatives --install /usr/bin/llvm-readelf llvm-readelf $(which llvm-readelf-18) 180
update-alternatives --install /usr/bin/llvm-size llvm-size $(which llvm-size-18) 180
update-alternatives --install /usr/bin/llvm-ar llvm-ar $(which llvm-ar-18) 180
update-alternatives --install /usr/bin/clang++ clang++ $(which clang++-18) 180
update-alternatives --install /usr/bin/clang clang $(which clang-18) 180
update-alternatives --install /usr/bin/ld.lld ld.lld $(which ld.lld-18) 180
update-alternatives --install /usr/bin/c++ c++ $(which clang++-18) 180
update-alternatives --install /usr/bin/cc cc $(which clang-18) 180
