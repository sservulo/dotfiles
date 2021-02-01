#!/bin/bash

# download package
wget -O /tmp/discord.deb "https://discordapp.com/api/download?platform=linux&format=deb"

# install
apt install /tmp/./discord.deb -y

