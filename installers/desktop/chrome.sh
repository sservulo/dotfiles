#!/bin/bash

# download package
wget -O /tmp/chrome.deb https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb

# install
apt install /tmp/./chrome.deb -y

