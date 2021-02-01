#!/bin/bash

# install oh-my-fish
curl -L https://get.oh-my.fish > /tmp/oh_my_fish
fish /tmp/oh_my_fish --path=~/.local/share/omf --config=~/.config/omf

pip3 install --user powerline-status

omf install bobthefish
