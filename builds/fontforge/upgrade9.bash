day=$(date | cut -d " " -f 1)
if [ "$day" = "Mon" ]
then
    rm -rf build
    #./bootstrap
    #./configure --without-libzmq --enable-fontforge-extras --enable-python-scripting=3
    #make
    #sudo make install
fi
mkdir build
pushd build
cmake -GNinja -DENABLE_X11=ON -DENABLE_FONTFORGE_EXTRAS=ON ..
ninja
ninja check
sudo ninja install
popd
sudo ldconfig
