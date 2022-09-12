sudo apt-get install docbook-utils libicu-dev
# autoreconf -i
mkdir build
pushd build
# ../configure
cmake -DCMAKE_BUILD_TYPE=Debug ..
make
sudo make install
popd
