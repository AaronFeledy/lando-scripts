#!/bin/bash

## Lando Script launcher
## This file is used launch lando-scripts scripts.
## ------------------------------------------------------------

REMOTE_TASKS=true # This script connects to remote servers.

# Load common functions and variables
SCRIPTPATH=$(dirname "${BASH_SOURCE[0]}") && source $SCRIPTPATH/common/init.sh

read -p "Overwrite local files directory? (y/n) " -n 1 -r
echo

if [[ $REPLY =~ ^[Yy]$ ]]
then
  trap exit ERR

  rsync -avz --del --progress -e "ssh -p $SSH_PORT -i $SSH_KEY_FILE" $SSH_USER@$SSH_SERVER:$SSH_REM_DIR/$FILES_DIR /app/$FILES_DIR/..

  kill $SSH_AGENT_PID
fi
