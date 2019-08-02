#!/bin/bash

read -p "Overwrite your local database? (y/n) " -n 1 -r
echo

if [[ $REPLY =~ ^[Yy]$ ]]
then
  trap exit ERR

  # Load common functions and variables
  SCRIPTPATH=$(dirname "${BASH_SOURCE[0]}") && source $SCRIPTPATH/common/init.sh

  include remote

  # We need a remote username to continue
  REMOTE_USER="$(remote_user)"
  [ ! -z "$REMOTE_USER" ] || die "A username is required!"

  if $DB_REM_SCRIPT ; then
    # Execute tasks on remote server
    ssh -tt -p $SSH_PORT $REMOTE_USER@$SSH_SERVER "/bin/bash -sl -- \"$SSH_REM_DIR\" \"$DB_REM_BACKUP_CMD\"" < $SCRIPTPATH/pull-database-remote.sh
    
    # Download db dump
    scp -P $SSH_PORT $REMOTE_USER@$SSH_SERVER:$DB_REM_DUMP_FILE.gz .
    
    # Delete db dump on remote
    ssh -t -p $SSH_PORT $REMOTE_USER@$SSH_SERVER "rm -fv $DB_REM_DUMP_FILE.gz"
  fi
	
  # Import db dump
  /helpers/mysql-import.sh $DB_REM_DUMP_NAME.gz
	
  kill $SSH_AGENT_PID
fi
