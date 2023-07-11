# use XeTeX from Ubuntu and not a newer TeX Live
export PATH=/usr/bin:$PATH

python3 -m pip install --user -e .

# python3 setup.py develop --user

# sudo python3 setup.py develop

# python3 setup.py build
# sudo python3 setup.py install

# sudo install -m 644 smithlib/classes/ftml.* /usr/local/share/sile/classes
sudo install -m 644 bash_completion_smith /etc/bash_completion.d/smith
pushd docs/smith
./build-docs.sh
popd
