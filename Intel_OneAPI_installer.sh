#!/bin/bash

sudo apt purge gcc llvm lld

sudo apt install -y gpg-agent wget

# Getting key
wget -O- https://apt.repos.intel.com/intel-gpg-keys/GPG-PUB-KEY-INTEL-SW-PRODUCTS.PUB | gpg --dearmor | sudo tee /usr/share/keyrings/oneapi-archive-keyring.gpg > /dev/null

# Adding repository
echo "deb [signed-by=/usr/share/keyrings/oneapi-archive-keyring.gpg] https://apt.repos.intel.com/oneapi all main" | sudo tee /etc/apt/sources.list.d/oneAPI.list

sudo apt update

#Installing Intel OneAPI LLVM
sudo apt install intel-oneapi-compiler-dpcpp-cpp
#Ref.:https://www.intel.com/content/www/us/en/developer/tools/oneapi/dpc-compiler-download.html?operatingsystem=linux&distribution-linux=apt

. /opt/intel/oneapi/setvars.sh --include-intel-llvm
#Ref.:https://www.intel.com/content/www/us/en/docs/dpcpp-cpp-compiler/developer-guide-reference/2025-2/specifying-the-location-of-compiler-components.html#GUID-E509E9EC-9E67-4183-B990-2DADD2A43E5A

sudo update-alternatives --install /usr/bin/llvm-objcopy llvm-objcopy $(icx --print-prog-name=llvm-objcopy) 50
sudo update-alternatives --install /usr/bin/llvm-ar llvm-ar $(icx --print-prog-name=llvm-ar) 50
sudo update-alternatives --install /usr/bin/clang++ clang++ $(icx --print-prog-name=clang++) 50
sudo update-alternatives --install /usr/bin/ld.lld ld.lld $(icx --print-prog-name=ld.lld) 50
sudo update-alternatives --install /usr/bin/clang clang $(icx --print-prog-name=clang) 50
sudo update-alternatives --install /usr/bin/c++ c++ $(icx --print-prog-name=icpx) 50
sudo update-alternatives --install /usr/bin/cc cc $(icx --print-prog-name=icx) 50
