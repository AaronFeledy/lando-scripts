#!/bin/bash

## SSH connection handler file
## This file is used to establish remote SSH connections.
## ------------------------------------------------------------

# This script connects to remote servers.
REMOTE_TASKS=true

# Bootstrap
SCRIPTPATH="${0%/*}"; source $SCRIPTPATH/bootstrap.sh

echo "Connecting to $SSH_USER@$SSH_SERVER..."

# Start SSH connection
ssh -t -p $SSH_PORT $SSH_USER@$SSH_SERVER "cd $SSH_REM_DIR; exec \$SHELL -l"
