#!/bin/bash
# Abort script if any command encounters an error
set -e

# Get dir where this script is located
DIR="$( cd "$( dirname "$0" )" && pwd )"
cd $DIR

# Wait for app host to be alive
echo "Waiting for app..."
while ! ping -c1 app &>/dev/null; do :; done

# Client name comes from the command line (this script is executed after
# the user has entered the value in the configuration wizard)
CLIENT_NAME="$1"

# Replace the variable in our application's config.php with the entered client name
echo "Setting client name to: $CLIENT_NAME"
sed -e "s#CLIENT_NAME#$CLIENT_NAME#g" "$DIR/config-template.php" > "$DIR/config.php"

# Transfer the config file to the app host
scp -i /scripts/sshid-docker-internal -oStrictHostKeyChecking=no "$DIR/config.php" root@app:/var/www/html/config.php

# Remove temporary file
rm "$DIR/config.php"
