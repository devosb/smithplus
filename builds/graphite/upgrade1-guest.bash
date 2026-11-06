rm -rf build
cmake -G Ninja -DGRAPHITE2_NTRACING=OFF -B build
cmake --build build
sudo cmake --install build
sudo ldconfig
