#!/bin/bash

## Common Functions
## 
## This script contains common functions for use within other scripts. There's
## no need to source this file as it is sourced by init.sh.
## ------------------------------------------------------------

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
