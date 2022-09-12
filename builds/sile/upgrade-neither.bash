# sudo luarocks install lua_cliargs 2.3-3
# for pkg in bit32 cosmo luaepnf luaexpat lpeg cassowary compat53 linenoise lua-zlib luafilesystem luarepl luasec luasocket penlight stdlib vstruct
# do
#     sudo luarocks install $pkg
# done
sudo apt-get install fonts-sil-gentiumplus libarchive-tools libfontconfig1-dev libharfbuzz-dev libicu-dev liblua5.3-dev libpng-dev lua5.3 lua-sec lua-socket lua-zlib-dev luarocks poppler-utils
./bootstrap.sh
./configure --with-system-luarocks
make
sudo make install
sudo ldconfig
