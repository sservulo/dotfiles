#!/bin/bash

# prepare sources for bulk install
if [ "$PREP" -eq "1" ]; then
	echo "Preparing sources for $0, PREP: $PREP"
	exit 0
fi

REPO=BurntSushi/ripgrep
APP=ripgrep

echo "Downloading and installing package for $0"
sudo -u $USER gh release download --pattern '*.deb' --repo $REPO -D /tmp/$APP

apt install /tmp/$APP/*.deb -y
