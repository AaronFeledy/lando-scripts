# Bootstrap file
# Bootstraps various scripts by loading options and other functions.
# ------------------------------------------------------------

# This script is not meant to be run directly. It should be called by a lando-scripts script.
[ $(basename "$0") != "bootstrap.sh" ] || echo "[ERROR] This script cannot be executed directly." && exit
  
# Init variables
SCRIPTPATH="${0%/*}"  # Path of this script
CWD=$(pwd)            # Current working directory

# Load options
source $SCRIPTPATH/../.lando-scripts.options.sh
  
# Capture ssh key once
if [[ $SSH_KEY_PW == true && $REMOTE_TASKS == true ]] ; then
  eval `ssh-agent` > /dev/null
  ssh-add $SSH_KEY_FILE
fi
