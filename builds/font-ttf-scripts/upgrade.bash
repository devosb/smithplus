perl Makefile.PL
make
make test
sudo make install
pushd Examples
sudo install -m 755 *.pl /usr/local/bin
popd
