# static (for wasm)
rm -rf build/
cmake -DGRAPHITE2_NTRACING=OFF -DBUILD_SHARED_LIBS=OFF -B build
cmake --build build
cp -v -p build/src/libgraphite2.a ../harfbuzz/src/wasm/gr

# shared (dynamic)
rm -rf build/
cmake -DGRAPHITE2_NTRACING=OFF -B build
cmake --build build
sudo cmake --install build
sudo ldconfig
