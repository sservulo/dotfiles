#!/bin/bash

# prepare sources for bulk install
if [ "$PREP" -eq "1" ]; then
	echo "Preparing sources for $0, PREP: $PREP"
	exit 0
fi

echo "Downloading and installing package for $0"
apt install fish -y

# install oh-my-fish
sudo -u $USER curl -L https://get.oh-my.fish | fish

sudo -u $USER python -m pip install powerline-status

sudo -u $USER omf install bobthefish

exit
