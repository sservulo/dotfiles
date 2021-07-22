#!/bin/bash

# update package list
apt update > /dev/null

# install dependencies
apt install curl wget apt-transport-https python3 python3-pip -y
