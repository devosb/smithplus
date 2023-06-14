sudo rm -rf build
mkdir build

# On Ubuntu J... look at https://github.com/harfbuzz/harfbuzz/issues/3164#event-5302802120 for issues with ragel

# How to use meson/ninja https://github.com/harfbuzz/harfbuzz/issues/3242

if [ -f meson.build ]
then
    # meson build -Dgraphite=enabled -Dauto_features=enabled
    meson build -Dauto_features=enabled -Dwasm=enabled
    # meson compile -Cbuild -j9
    ninja -Cbuild -j8
    meson test -Cbuild --print-errorlogs
    pushd build
    sudo meson install
else
    export NOCONFIGURE=true
    ./autogen.sh
    pushd build
    ../configure --with-graphite2=yes --with-gobject --enable-introspection
    make
    sudo make install
    sudo cp ./src/*.typelib /usr/lib/girepository-1.0/
fi

popd
sudo ldconfig
