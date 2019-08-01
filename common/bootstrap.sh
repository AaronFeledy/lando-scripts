# Bootstrap file
# Bootstraps various scripts by loading options and other functions.
# ------------------------------------------------------------

# Init variables
SCRIPTPATH=$(dirname "${BASH_SOURCE[0]}")  # Path of this script
CWD=$(pwd)            # Current working directory

# Load options
source $SCRIPTPATH/../../.lando-scripts.options.sh
  
# Capture ssh key once
if [[ $SSH_KEY_PW == true && $REMOTE_TASKS == true ]] ; then
  eval `ssh-agent` > /dev/null
  ssh-add $SSH_KEY_FILE
fi
