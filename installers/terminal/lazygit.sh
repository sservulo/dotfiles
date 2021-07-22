#!/bin/bash

# prepare sources for bulk install
if [ "$PREP" -eq "1" ]; then
	echo "Preparing sources for $0, PREP: $PREP"

    add-apt-repository ppa:lazygit-team/release -y -n

	exit 0
fi

echo "Downloading and installing package for $0"
apt install lazygit
