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

# The $SCRIPTPATH variable represents the directory where this script resides.
SCRIPTPATH=$(dirname "${BASH_SOURCE[0]}");

# Some text colors
TXT_RESET="tput sgr 0"
TXT_BOLD="tput bold"
TXT_CYAN="tput setaf 6"
TXT_YEL="tput setaf 3"
TXT_RED="tput setaf 1"

# Source helper functions
source $SCRIPTPATH/functions.sh

# Init variables
CWD=$(pwd) # Current working directory

# Load options
source $SCRIPTPATH/../../.lando-scripts.options.sh
  
# Capture ssh key once
if [[ $SSH_KEY_PW == true && $REMOTE_TASKS == true ]] ; then
  eval `ssh-agent` > /dev/null
  ssh-add $SSH_KEY_FILE
fi
