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
)

SCRIPTPATH="${0%/*}";

# Display help message
function lando-scripts-help {
  # TODO: display a useful help message
  echo "HELP!"
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
      shift
      ;;
  esac
done

# Execute Lando Script
$SCRIPTPATH/${LANDO_SCRIPTS[$SCRIPT];}
