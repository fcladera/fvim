#!/bin/bash
set -euxo pipefail

function install {
    # Create packer dir
    mkdir -p ~/.local/share/nvim/site/pack/packer/start/
    # Download packer.nvim
    git clone --depth 1 https://github.com/wbthomason/packer.nvim ~/.local/share/nvim/site/pack/packer/start/packer.nvim
}

install
