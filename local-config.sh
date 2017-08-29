#!/bin/bash

echo "Applying local configuration for $LANDO_APP_NAME app..."

# Bootstrap
SCRIPTPATH="${0%/*}"; source $SCRIPTPATH/_options.sh

###
## Execute pre-config commands
###

for C in "${!PRE_CONFIG_COMMANDS[@]}"; do
  ${PRE_CONFIG_COMMANDS[$C]}
done

###
## Drush commands
###

if $DRUSH_ENABLE; then
  # Enable modules
  drush pm-enable -y $DRUSH_ENABLE_MODULES

  # Set Variables
  for V in "${!DRUSH_VARIABLE_SET[@]}"; do
    drush variable-set $V "${DRUSH_VARIABLE_SET[$V]}"
  done
fi

###
## Execute post-config commands
###

for C in "${!POST_CONFIG_COMMANDS[@]}"; do
  ${POST_CONFIG_COMMANDS[$C]}
done
