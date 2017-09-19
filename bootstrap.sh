# Bootstrap file
# Bootstraps various scripts by loading options and other functions.
# ------------------------------------------------------------
  
# Init variables
SCRIPTPATH="${0%/*}"  # Path of this script
CWD=$(pwd)            # Current working directory

# Load options
source $SCRIPTPATH/../.lando-scripts.options.sh
  
# Capture ssh key once
if $SSH_KEY_PW ; then
  echo $SSH_KEY_FILE
  eval `ssh-agent`
fi
