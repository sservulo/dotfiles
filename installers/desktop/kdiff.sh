#!/bin/bash

# prepare sources for bulk install
if [ "$PREP" -eq "1" ]; then
	echo "Preparing sources for $0"
	exit 0
fi

# install package
apt install kdiff3 -y
