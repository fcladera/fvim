#!/bin/bash

function install {
    rm -f ~/.vimrc
    ln -s  .vim/vimrc ~/.vimrc
}

install
