#!/bin/bash

## SSH connection handler file
## This file is used to establish remote SSH connections.
## ------------------------------------------------------------

# Load common functions and variables
SCRIPTPATH=$(dirname "${BASH_SOURCE[0]}") && source $SCRIPTPATH/common/init.sh

include remote

# We need a remote username to continue
REMOTE_USER="$(remote_user)"
[ ! -z "$REMOTE_USER" ] || die "A username is required!"

tell "Connecting to ${REMOTE_USER}@$SSH_SERVER..."

# Start SSH connection
ssh -t -p $SSH_PORT $REMOTE_USER@$SSH_SERVER "cd $SSH_REM_DIR; exec \$SHELL -l"
