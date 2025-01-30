sudo rm -rf build

# On Ubuntu J... look at https://github.com/harfbuzz/harfbuzz/issues/3164#event-5302802120 for issues with ragel

# How to use meson/ninja https://github.com/harfbuzz/harfbuzz/issues/3242

if [ -f meson.build ]
then
    meson setup build -Dgraphite2=enabled -Dauto_features=enabled -Ddocs=disabled -Dexperimental_api=true
    # meson setup build -Dauto_features=enabled -Dwasm=enabled -Ddocs=disabled
    meson compile -C build
    # ninja -C build
    meson test -C build --print-errorlogs
    #pushd build
    sudo meson install -C build
else
    mkdir build
    export NOCONFIGURE=true
    ./autogen.sh
    pushd build
    ../configure --with-graphite2=yes --with-gobject --enable-introspection
    make
    sudo make install
    sudo cp ./src/*.typelib /usr/lib/girepository-1.0/
    popd
fi

sudo ldconfig
