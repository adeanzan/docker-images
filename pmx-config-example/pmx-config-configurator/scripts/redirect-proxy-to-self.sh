#!/bin/bash
# Abort script if any command encounters an error
set -e

# Get dir where this script is located
DIR="$( cd "$( dirname "$0" )" && pwd )"
cd $DIR

# Wait for proxy host to be alive
echo "Waiting for proxy..."
while ! ping -c1 proxy &>/dev/null; do :; done

# determine our IP
IP="$(ifconfig eth0 |grep "inet addr:" | cut -d':' -f 2 | cut -d' ' -f 1)"

# Replace the variable in our haproxy.cfg with the IP address we determined
sed -i -e "s#EXTERNAL_IP#$IP#g" $DIR/haproxy.cfg

# Transfer the haproxy.cfg file to the proxy host
scp -i /scripts/sshid-docker-internal -oStrictHostKeyChecking=no $DIR/haproxy.cfg root@proxy:/etc/haproxy/haproxy.cfg

# Restart haproxy on the remote host
ssh -i /scripts/sshid-docker-internal -oStrictHostKeyChecking=no root@proxy "/usr/bin/supervisorctl restart haproxy"


