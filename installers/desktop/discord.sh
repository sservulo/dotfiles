#!/bin/bash

# prepare sources for bulk install
if [ "$PREP" -eq "1" ]; then
	echo "Preparing sources for $0"

    wget -O /tmp/discord.deb "https://discordapp.com/api/download?platform=linux&format=deb"

	exit 0
fi

echo "Downloading and installing package for $0"
apt install /tmp/./discord.deb -y
