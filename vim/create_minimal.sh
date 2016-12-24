#!/usr/bin/env bash
cat \
    20-* \
    70-*.vim \
    $HOME/.vim/bundle/base16-vim/colors/base16-default-dark.vim

echo set nospell
