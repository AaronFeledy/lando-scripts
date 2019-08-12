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

  function download_db() {
    # Download db dump from remote server
    scp -P $SSH_PORT $REMOTE_USER@$SSH_SERVER:$DB_REM_DUMP_FILE .
  }


  if $DB_REM_SCRIPT ; then
    # Execute tasks on remote server to dump db.
    ssh -tt -p $SSH_PORT $REMOTE_USER@$SSH_SERVER "/bin/bash -sl -- \"$SSH_REM_DIR\" \"$DB_REM_BACKUP_CMD\"" < $SCRIPTPATH/pull-database-remote.sh
    
    download_db
    
    # Delete newly created db dump on remote.
    ssh -t -p $SSH_PORT $REMOTE_USER@$SSH_SERVER "rm -fv $DB_REM_DUMP_FILE"

  else
    # Download db dump that already exists.
    download_db
  fi
	
  # Import db dump
  /helpers/mysql-import.sh $DB_REM_DUMP_NAME.gz
	
  [ -z "$SSH_AGENT_PID" ] || kill $SSH_AGENT_PID
fi
