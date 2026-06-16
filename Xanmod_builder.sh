#!/bin/bash

# Downloads source code
RELEASE=$(uname -r | cut -d. -f1-2)
git clone --depth 1 --single-branch --branch $RELEASE https://gitlab.com/xanmod/linux.git
cd linux

# Cleans previous builds
make clean
make mrproper

# Copies currently kernel config
cp /boot/config-$(uname -r) .config

# Overrides some kernel configurations
source ../intel_kernel_settings.sh

#Build modules
#make modules

# Avoids WARNING: Module.symvers is missing.
#cp /usr/src/linux-headers-$(uname -r)/Module.symvers . || true

# Points LSMOD variable to the modprobed-db database
make LSMOD=$HOME/.config/modprobed.db localmodconfig

# Builds the kernel
# Ref.:https://www.kernel.org/doc/html/v6.6/kbuild/llvm.html
make LLVM=1 \
KCFLAGS="-qopt-streaming-stores=auto, -ipo, -O3, -static, -fp-model=fast" \
USERCFLAGS="-qopt-streaming-stores=auto, -ipo, -O3, -static, -fp-model=fast" \
-j$(nproc)
#Flags above are alternetives to -fast flag
#Ref.:https://doku.lrz.de/comparison-of-compiler-options-intel-vs-pgi-vs-gcc-11481685.html#ComparisonofCompilerOptions(intelvs.pgivs.gcc)-CompilerDirectivesfortheIntelcompiler
#Ref.:https://www.intel.com/content/www/us/en/docs/dpcpp-cpp-compiler/developer-guide-reference/2025-2/fast.html

# Kernel modules install
sudo make modules_install

# Kernel install
sudo make install

# GRUB update
sudo update-grub
