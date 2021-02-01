#!/bin/bash

# neovim
apt install neovim -y

# plug
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
       
# auto install plugins
nvim +PlugInstall +qall
