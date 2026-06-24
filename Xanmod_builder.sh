#!/bin/bash

# Downloads source code
RELEASE=$(uname -r | cut -d. -f1-2)
git clone --depth 1 --single-branch --branch $RELEASE https://gitlab.com/xanmod/linux.git
cd linux

# Cleans previous builds
make mrproper
make clean

# Copies currently kernel config
cp /boot/config-$(uname -r) .config

# Overrides some kernel configurations
source ../intel_kernel_settings.sh

# Points LSMOD variable to the modprobed-db database
make localmodconfig

# Building the the kernel

make CC=clang \
    LD=ld.lld \
    AR=llvm-ar \
    NM=llvm-nm \
    STRIP=llvm-strip \
    OBJCOPY=llvm-objcopy \
    OBJDUMP=llvm-objdump \
    READELF=llvm-readelf \
    HOSTCC=clang \
    HOSTCXX=clang++ \
    HOSTAR=llvm-ar \
    HOSTLD=ld.lld \
    -j$(nproc)

#Ref.:https://docs.kernel.org/kbuild/llvm.html#building-with-llvm
#Ref.:https://www.kernel.org/doc/html/latest/kbuild/llvm.html#building-with-llvm

# Kernel modules install
sudo make modules_install

# Kernel install
sudo make install

#Ref.:https://wiki.gentoo.org/wiki/Kernel/Configuration#Setup

# GRUB update
sudo update-grub
