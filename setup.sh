#!/bin/bash

function install {
    rm -f ~/.vimrc
    # Download vim.plug
    curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
          https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    # Create symlink to vimrc
    ln -s  ~/.vim/vimrc ~/.vimrc
}

install
