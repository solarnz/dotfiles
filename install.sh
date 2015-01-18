#!/bin/bash

# Install rcm to $HOME/.local/
TEMP=`mktemp -d -p $HOME`
pushd $TEMP
wget https://thoughtbot.github.com/rcm/dist/rcm-1.2.3.tar.gz
tar xvzf rcm-1.2.3.tar.gz
pushd rcm-1.2.3
./configure --prefix=$HOME/.local/
make && make install

popd
popd
rm -rf $TEMP

# Install dotfiles
PATH=$PATH:$HOME/.local/bin $HOME/.local/bin/rcup -d `dirname $0`
