## Options file
## This file is used for setting options for your scripts.
## Rename this file to _options.sh and edit options as needed.
## ------------------------------------------------------------

###
## SSH Options
###

# The URL or IP used to connect the remote SSH server.
SSH_SERVER='server.example.com' #(string)

# SSH username
SSH_USER='username' #(string)

# SSH key path. /user represents the home directory for the current user on the host machine.
SSH_KEY_FILE='/user/.ssh/id_rsa' #(string)

# Prompt for SSH key password prior to executing script.
SSH_KEY_PW=true #(true,false)

# Remote working directory
SSH_REM_DIR="/home/$SSH_USER/public_html" #(string)


###
## Remote Database Options
###

# Execute bash script on SSH server to backup database.
DB_REM_SCRIPT=true #(true,false)

# Filename for database dump on remote server
DB_REM_DUMP_NAME="lando-pull-sql-dump.sql" #(string)

# Path to database dump file on remote server
DB_REM_DUMP_PATH="/home/$SSH_USER" #(string)

# Full path to dump file
DB_REM_DUMP_FILE="$DB_REM_DUMP_PATH/$DB_REM_DUMP_NAME" #(string)

# Bash command to execute on remote server if $DB_REM_SCRIPT is true. Command is executed from $SSH_REM_DIR.
DB_REM_BACKUP_CMD="drush sql-dump -v --yes --gzip --structure-tables-list='cache,cache_*,history,search_*,sessions,watchdog' --result-file=$DB_REM_DUMP_FILE" #(string)



###
## Local Config Options
###

### Pre-config

PRE_CONFIG_COMMANDS=(  # Commands to run prior to running the local-config script. (string)
  'echo "pre-config one"'  # First command (string)
  'echo "pre-config two"'   # Second command (string)
)


### Drush (Requires Drush Drupal command line tool)

# Enable execution of Drush commands.
DRUSH_ENABLE=true #(true,false)

# A space-separated string of modules to be enabled.
DRUSH_ENABLE_MODULES='stage_file_proxy'

# Set Drupal variables. ([variable_name]='value')
declare -A DRUSH_VARIABLE_SET=(
	[stage_file_proxy_origin]='http://example.com'
  [cache]=0
  [block_cache]=0
  [preprocess_js]=0
  [preprocess_css]=0
)


### Post-config

POST_CONFIG_COMMANDS=(  # Commands to run after running the local-config script.
  'echo "pre-config one"'  # First command (string)
  'echo "pre-config two"'   # Second command (string)
)
