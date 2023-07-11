# cd product-mini/platforms/linux
mkdir build
cd build
cmake .. -DWAMR_BUILD_REF_TYPES=1 -DWAMR_BUILD_FAST_JIT=1
make
sudo make install
sudo ldconfig
cd ..
