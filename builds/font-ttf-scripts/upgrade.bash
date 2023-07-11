perl Makefile.PL
make
make test
sudo make install
sudo install -m 755 Examples/*.pl /usr/local/bin
