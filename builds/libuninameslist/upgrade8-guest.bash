autoreconf -i
automake --foreign
./configure
make
sudo make install
sudo ldconfig
