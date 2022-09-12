cabal v2-update
cabal v2-build -j

# old v1
# cabal update
# cabal install --only-dependencies
# cabal configure
# cabal build

# pushd dist/build
for prog in RepoList DependencyRoots
do
    sudo install -m 755 dist-newstyle/build/x86_64-linux/ghc-*/RepoExplorer-*/*/${prog}/build/${prog}/${prog} /usr/local/bin
done
# popd
