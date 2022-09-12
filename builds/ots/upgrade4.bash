git submodule update --init --recursive

#meson -Ddebug=true -Dgraphite=true build
export CC=clang
export CXX=clang++
rm -rf build
meson build
ninja -C build

# Reads all the fonts on my system,
# in additonal to the fonts in the source tree,
# so it take a long time to run.
#ninja -C build test

sudo ninja -C build install
# Don't know how to make the new build system install the binaries
#pushd build
#sudo install -m 755 ots-sanitize ots-perf ots-idempotent ots-validator-checker ots-side-by-side /usr/local/bin
#popd

#./autogen.sh
#./configure
#make CXXFLAGS=-DOTS_DEBUG
#sudo make install

# sudo rm /usr/local/lib/libz.a
sudo chmod 755 $HOME/.local/lib/python*/site-packages/opentype_sanitizer-*/ots/ots-sanitize
