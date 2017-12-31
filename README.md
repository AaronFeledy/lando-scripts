# Lando Scripts

Lando Scripts provides useful scripts for the [Lando](https://docs.devwithlando.io/) local development environment and DevOps tool.

### Features
Each of the following can be performed with a single command:
 * Import your remote database into your local Lando app.
 * Download your remote files into your local Lando app.
 * Reconfigure your app for use in the local environment.
 * SSH into your app's remote server.
 * Push untracked libraries, such as those installed by Composer, to the remote server.
 
### Installation
  1. Clone this repository into a directory within your app. (e.g. `myapp/scripts/lando-scripts`)
  2. Copy `.lando-scripts.options.example` into parent directory and rename it to `.lando-scripts.options.sh` (e.g. myapp/scripts/.lando-scripts.options.sh)
  3. Provide your configuration by editing your `.lando-scripts.options.sh` file.
  4. Add the following to your .lando.yml:
      ```
      tooling:
        script:
          description: Execute a Lando Scripts script.
          service: appserver
          cmd: /app/scripts/lando-scripts/script.sh
      ```
    
### Usage
Execute Lando Scripts using the new `script` command that is now available to Lando.
`lando script --help` for details on available commands
