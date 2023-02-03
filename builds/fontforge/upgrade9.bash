rm -rf build
mkdir build
pushd build
cmake -GNinja -DENABLE_X11=ON -DENABLE_FONTFORGE_EXTRAS=ON ..
ninja
ninja check
sudo ninja install
popd
sudo ldconfig
