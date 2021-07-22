#!/bin/bash

# prepare sources for bulk install
if [ "$PREP" -eq "1" ]; then
	echo "Preparing sources for $0, PREP: $PREP"

	# check version and add ppa if needed
	os_version=$(lsb_release -cs)
	if [[ "$os_version" == "bionic" ]]; then
		add-apt-repository ppa:neovim-ppa/stable -y -n
	fi

	exit 0
fi

echo "Downloading and installing package for $0"
apt install neovim -y

# plug
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
       
# auto install plugins
sudo -u $USER nvim +PlugInstall +qall
