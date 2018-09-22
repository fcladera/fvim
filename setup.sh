#!/bin/bash

function install {
    rm -f ~/.vimrc ~/.config/nvim/init.vim
    # Download vim.plug
    curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
          https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    # Create symlink to vimrc
    ln -s  ~/.vim/vimrc ~/.vimrc
    # Create symlink to init.vim
    mkdir -p ~/.config/nvim && ln -s ~/.vim/init.vim ~/.config/nvim/init.vim
}

install
