#!/bin/bash
set -euxo pipefail

function install {
    # Download vim.plug
    curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs \
          https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    nvim +PlugInstall
}

install
