#!/bin/bash

## Lando Script launcher
## This file is used launch lando-scripts scripts.
## ------------------------------------------------------------

# Define available scripts
declare -A LANDO_SCRIPTS=(
  [ssh]='ssh.sh'
  [pull-db]='pull-database.sh'
  [pull-files]='pull-files.sh'
  [local-config]='local-config.sh'
  [push-lib]='push-libraries.sh'
)

SCRIPTPATH="${0%/*}";

# Display help message
function lando-scripts-help {
  # List avaialable scripts
  echo; echo "Usage: lando script <script name>"; echo
  echo "$(tput setaf 2)Available scripts:$(tput sgr0)"
  for S in "${!LANDO_SCRIPTS[@]}"; do
    tput cuf 2; echo $S
  done
}

# Parse arguments
while (( "$#" )); do
  case "$1" in
    --help)
        # Display help
        lando-scripts-help
        shift
      ;;
    --)
      shift
      break
      ;;
    -*|--*=)
      echo "Error: Unsupported flag $1" >&2
      exit 1
      ;;
    *)
      SCRIPT="$1"
      EXECUTE=true
      shift
      ;;
  esac
done

# Execute Lando Script
# ...do something interesting...
if [ "$EXECUTE" = true ] ; then
  $SCRIPTPATH/${LANDO_SCRIPTS[$SCRIPT];}
fi
