#!/bin/bash

## Push libraries script
##
## This script pushes code libraries, such as those installed
## by Composer, to the remote server.
## ------------------------------------------------------------

REMOTE_TASKS=true # This script connects to remote servers.

# Load common functions and variables
SCRIPTPATH=$(dirname "${BASH_SOURCE[0]}") && source $SCRIPTPATH/common/init.sh

# Check that required vars are defined.
if [ -z "$LIBRARY_DIRS" ] 
then
	echo "Please set LIBRARY_DIRS in .lando-scripts.options.sh before using this command."
  exit 1
fi

read -p "Overwrite remote library directories? (y/n) " -n 1 -r
echo

if [[ $REPLY =~ ^[Yy]$ ]]
then
  trap exit ERR

  cd /app; rsync -avzR -e "ssh -p $SSH_PORT" $LIBRARY_DIRS $SSH_USER@$SSH_SERVER:$SSH_REM_DIR
  
  kill $SSH_AGENT_PID
fi
