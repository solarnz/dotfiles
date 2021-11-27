#!/bin/bash

# Install rcm to $HOME/.local/
mkdir /tmp/dotfiles
TEMP=/tmp/dotfiles
pushd $TEMP
wget https://github.com/thoughtbot/rcm/archive/refs/tags/v1.2.3.tar.gz
tar xvzf v1.2.3.tar.gz
pushd rcm-1.2.3
./autogen.sh
./configure --prefix=$HOME/.local/
make && make install

popd
popd
#rm -rf $TEMP

# Install dotfiles
PATH=$PATH:$HOME/.local/bin $HOME/.local/bin/rcup -d `dirname $0`
