#!/bin/bash

## Common Functions
## 
## This script contains common functions for use within other scripts. There's
## no need to source this file as it is sourced by init.sh.
## ------------------------------------------------------------

THIS_DIR=$(dirname "${BASH_SOURCE[0]}") # The directory where this script resides.

# Some useful functions
tell() { echo "$($TXT_YEL)$*$($TXT_RESET)" >&2; }
yell() { echo "$($TXT_RED)$(tput bold)$*$($TXT_RESET)" >&2; }
die() { echo; yell "$*"; echo; exit 111; }
try() { "$@" || yell "Cannot $*"; }

# Sources include files
include() {
  try source "${THIS_DIR}/../includes/$1.sh"
}

# Sources a file if it exists.
# Usage: `source_if_exists /path/to/file`
source_if_exists() {
  [[ -f "$1" ]] && source "$1"
}

# Scripts that require root can call this function to stop execution if user is not root or sudo.
require_root() {
 if [[ $UID != 0 ]]; then
   die "This script requires elevated privileges."
 fi
}
