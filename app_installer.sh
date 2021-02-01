#!/bin/bash

MODE=0
TERMINAL=1
DESKTOP=0
FULL=0

function print_help {

  echo "
  This script allows simple setup selection.

  $0 [options]

  Options for environment:

   --terminal      - Installs and configures base terminal utilities (git, vim, etc.).    [default: yes]

   --desktop       - Installs desktop apps (Chrome, Discord, etc.).                       [default: no ]

   --full          - Installs full set of apps and configurations.                        [default: no ]
                     Equal of usage of both terminal and desktop options.

   --help, -h     - prints this message

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
  "--help" | "-h") print_help; exit ;;
  *) echo "Unrecognized param: $1. Use --help or -h to see options."; shift ;;
  esac
done

chmod +x ./installers/common.sh
sudo ./installers/common.sh

if [ $TERMINAL ]
then
  for filename in ./installers/terminal/*.sh; do
    chmod +x $filename
    sh -c $filename
done
fi

if [ $DESKTOP ]
then
  for filename in ./installers/desktop/*.sh; do
    chmod +x $filename
    sh -c $filename
done
fi

