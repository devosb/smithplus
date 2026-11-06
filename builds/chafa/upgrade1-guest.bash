sudo rm -rf build
mkdir build

export NOCONFIGURE=true
./autogen.sh
pushd build
../configure
make
sudo make install
popd
sudo ldconfig
