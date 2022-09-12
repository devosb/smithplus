# mkdir build
# pushd build
# cmake ..
# make
cmake -DGRAPHITE2_NTRACING=OFF -B build
cmake --build build
sudo cmake --install build
# sudo make install
sudo ldconfig
# popd
