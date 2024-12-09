#!/bin/bash

# Downloads source code
git clone --depth 1 --branch 6.11 https://gitlab.com/xanmod/linux.git
cd linux

# Cleans previous builds
make clean
make mrproper

# Copies currently kernel config
cp /boot/config-$(uname -r) .config

# Overrides some kernel configurations
source ../intel_kernel_settings.sh

# Avoids WARNING: Module.symvers is missing.
cp /usr/src/linux-headers-$(uname -r)/Module.symvers . || true

# Points LSMOD variable to the modprobed-db database
make LSMOD=$HOME/.config/modprobed.db localmodconfig

# Builds the kernel
# Ref.:https://www.kernel.org/doc/html/v6.6/kbuild/llvm.html
make -j$(nproc) \
CC=clang \
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
#KCFLAGS="-O3 -flto -static -ffast-math" \
#HOSTCFLAGS="-O3 -flto -static -ffast-math" \
LDFLAGS="-fuse-ld=lld"
#Flags above are alternetives to -fast flag Ref.:https://www.intel.com/content/www/us/en/docs/dpcpp-cpp-compiler/developer-guide-reference/2025-0/fast.html

# Kernel modules install
sudo make modules_install

# Kernel install
sudo make install

# GRUB update
sudo update-grub
