#!/bin/bash

# prepare sources for bulk install
if [ "$PREP" -eq "1" ]; then
	echo "Preparing sources for $0"

    wget -O /tmp/chrome.deb "https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb"

	exit 0
fi

echo "Downloading and installing package for $0"
apt install /tmp/./chrome.deb -y
