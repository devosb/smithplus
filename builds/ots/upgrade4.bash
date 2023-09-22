git submodule update --init --recursive

export CC=clang
export CXX=clang++
rm -rf build
#meson setup -Ddebug=true -Dgraphite=true build
meson setup build
ninja -C build
sudo meson install -C build

# Reads all the fonts on my system,
# in additonal to the fonts in the source tree,
# so it take a long time to run.
#ninja -C build test
