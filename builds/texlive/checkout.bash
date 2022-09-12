sudo mkdir /usr/local/texlive
sudo chown $USER:$USER /usr/local/texlive
mkdir texlive
pushd texlive
wget http://mirror.ctan.org/systems/texlive/tlnet/install-tl-unx.tar.gz
tar -zxf install-tl-unx.tar.gz
popd
