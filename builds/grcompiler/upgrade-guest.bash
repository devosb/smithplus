rm -rf build
mkdir build
cmake -G Ninja -DCMAKE_BUILD_TYPE=Debug -B build
cmake --build build
sudo cmake --install build
