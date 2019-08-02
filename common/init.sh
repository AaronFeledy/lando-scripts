#!/bin/bash

## Script Initializer
##
## This script contains common variables and functions to initialize other
## scripts within this project. Source this script at the beginning of other
## scripts by using:
##
## SCRIPTPATH=$(dirname "${BASH_SOURCE[0]}) && source $SCRIPTPATH/common/init.sh
##
## ------------------------------------------------------------

# Init variables
THIS_DIR=$(dirname "${BASH_SOURCE[0]}") # The directory where this script resides.
CALLER_DIR=$(dirname "${BASH_SOURCE[1]}") # The directory of the script that called init.sh
CALLER_NAME=$(basename "${BASH_SOURCE[1]}") # The name of the script that called init.sh
CWD=$(pwd) # Current working directory

# Some text colors
TXT_RESET="tput sgr 0"
TXT_BOLD="tput bold"
TXT_CYAN="tput setaf 6"
TXT_YEL="tput setaf 3"
TXT_RED="tput setaf 1"

# Source helper functions
source $THIS_DIR/functions.sh

# Load options
source $THIS_DIR/../../.lando-scripts.options.sh

# Capture ssh key once
if [[ $SSH_KEY_PW == true && $REMOTE_TASKS == true ]] ; then
  eval `ssh-agent` > /dev/null
  ssh-add $SSH_KEY_FILE
fi
