#!/bin/bash

sudo su
apt purge gcc llvm ld.lld

apt update
apt install -y gpg-agent wget

# Getting key
wget -O- https://apt.repos.intel.com/intel-gpg-keys/GPG-PUB-KEY-INTEL-SW-PRODUCTS.PUB | gpg --dearmor | sudo tee /usr/share/keyrings/oneapi-archive-keyring.gpg > /dev/null

# Adding repository
echo "deb [signed-by=/usr/share/keyrings/oneapi-archive-keyring.gpg] https://apt.repos.intel.com/oneapi all main" | sudo tee /etc/apt/sources.list.d/oneAPI.list


#Installing Intel OneAPI LLVM
apt install intel-oneapi-compiler-dpcpp-cpp

update-alternatives --install /usr/bin/llvm-objdump llvm-objdump $(dpcpp --print-prog-name=llvm-objdump) 50
update-alternatives --install /usr/bin/llvm-objcopy llvm-objcopy $(dpcpp --print-prog-name=llvm-objcopy) 50
update-alternatives --install /usr/bin/llvm-readelf llvm-readelf $(dpcpp --print-prog-name=llvm-readelf) 50
update-alternatives --install /usr/bin/llvm-strip llvm-strip $(dpcpp --print-prog-name=llvm-strip-50) 50
update-alternatives --install /usr/bin/llvm-ar llvm-ar $(dpcpp --print-prog-name=llvm-ar) 50
update-alternatives --install /usr/bin/clang++ clang++ $(dpcpp --print-prog-name=clang++) 50
update-alternatives --install /usr/bin/clang clang $(dpcpp --print-prog-name=clang) 50
update-alternatives --install /usr/bin/ld.lld ld.lld $(dpcpp --print-prog-name=ld.lld) 50
update-alternatives --install /usr/bin/c++ c++ $(dpcpp --print-prog-name=clang++) 50
update-alternatives --install /usr/bin/cc cc $(dpcpp --print-prog-name=clang) 50

#Ref.:https://www.intel.com/content/www/us/en/developer/tools/oneapi/base-toolkit-download.html?operatingsystem=linux&linux-install-type=apt

