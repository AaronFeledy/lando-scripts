## Remote database pull file
## This file is executed on the remote server during database pull via SSH.
## ------------------------------------------------------------

trap exit ERR

WORKING_DIR=$1
DB_BACKUP_CMD=$2

# Backup db
cd $WORKING_DIR
# Execute backup command
echo $(tput setab 6); echo; echo; echo "  Backing up database..."; echo; echo $(tput sgr 0); $DB_BACKUP_CMD

exit 0
