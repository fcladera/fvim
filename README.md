# fvim

This is my vim distribution. It is inspired in [janus](https://github.com/carlhuda/janus),
[spf13-vim](https://github.com/spf13/spf13-vim) and [tpope's dotfiles](https://github.com/tpope/tpope).
However, I try to keep things simple and focus on speed.

A piece of advice: write your **own** .vimrc file. Fork this repository
and tune it, it provides a good starting point!

**This distribution is not intended to work in Windows!**

## Install

1. Backup your existing vim configuration files (if wanted) and remove
   your old .vim folder.

    ```
    rm -rf ~/.vim
    ```
2. Clone this repo (or your fork) into the .vim folder.

    ```
    git clone --recursive https://github.com/fcladera/fvim.git ~/.vim
    ```

3. Execute the install script.

    ```
    ~/.vim/setup.sh
    ```

## Update

## Plugins

## Mappings

Leader key is mapped to ```,```

Pastetoggle is maped to ```<F10>```
