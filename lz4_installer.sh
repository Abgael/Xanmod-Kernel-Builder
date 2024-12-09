git clone --depth 1 --branch release https://github.com/lz4/lz4.git
cd lz4
make -j$(nproc)
sudo make install
