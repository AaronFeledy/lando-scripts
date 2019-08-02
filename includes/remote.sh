## Remote connection handler.
##
## This file contains functions for preparing remote server connections.
## ------------------------------------------------------------

# This script connects to remote servers.
REMOTE_TASKS=true

# Returns the remote user as defined in the options file. If not defined, it asks for the username.
function remote_user() {
  if [[ -n "${SSH_USER}" ]]; then
    echo $SSH_USER
  else
    read -p "$($TXT_CYAN)$(echo -e 'Enter your remote username: \n\b > ')$($TXT_RESET)" -re
    if [[ ! -z "$REPLY" ]]; then
      SSH_USER=${REPLY}
      echo $SSH_USER
    else
      exit 1
    fi
  fi
}
