#!/bin/bash

MODE=0
TERMINAL=1
DESKTOP=0
export USER=samuel
export PREP=0

function print_help {

  echo "
  This script allows simple setup selection.

  $0 [options]

  Options for environment:

   --terminal      - Installs and configures base terminal utilities (neovim, etc.).    [default: yes]

   --desktop       - Installs desktop apps (Chrome, Discord, etc.).                     [default: no]

   --full          - Installs full set of apps and configurations.                      [default: no]
                     Equal of usage of both terminal and desktop options.

   --user          - User to use in non root configuration                              [default: samuel]

   --help, -h      - prints this message

  e.g.:

  Installation of only terminal apps and dotfile configs:
      setup.sh --terminal

  Installation of only desktop apps:
      setup.sh --desktop

  Installation of full suite:
      setup.sh --full
  "
}

while (( "$#" )); do
  case "$1" in
  "--terminal") TERMINAL=1; shift ;;
  "--desktop") DESKTOP=1; shift ;;
  "--full") TERMINAL=1; DESKTOP=1; shift ;;
  "--user") USER="$2"; shift 2 ;;
  "--help" | "-h") print_help; exit ;;
  *) echo "Unrecognized param: $1. Use --help or -h to see options."; shift ;;
  esac
done

# setup dotfiles
chmod +x dotfiles_installer.sh
sudo -u $USER ./dotfiles_installer.sh

# install support packages (curl, wget, etc.)
chmod +x ./installers/common.sh
./installers/common.sh

PREP=1
if [ "$TERMINAL" -eq "1" ]; then
  for filename in ./installers/terminal/*.sh; do
    chmod +x $filename
    ./$filename
done
fi

if [ "$DESKTOP" -eq "1" ]; then
  for filename in ./installers/desktop/*.sh; do
    chmod +x $filename
    ./$filename
done
fi

# update package list
apt update > /dev/null

PREP=0
if [ "$TERMINAL" -eq "1" ]; then
  for filename in ./installers/terminal/*.sh; do
    chmod +x $filename
    ./$filename
done
fi

if [ "$DESKTOP" -eq "1" ]; then
  for filename in ./installers/desktop/*.sh; do
    chmod +x $filename
    ./$filename
done
fi
