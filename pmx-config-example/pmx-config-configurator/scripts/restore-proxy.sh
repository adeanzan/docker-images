#!/bin/bash
# Abort script if any command encounters an error
set -e

# Get dir where this script is located
DIR="$( cd "$( dirname "$0" )" && pwd )"
cd $DIR

# Restore original haproxy.cfg and restart haproxy
ssh -i /scripts/sshid-docker-internal -oStrictHostKeyChecking=no root@proxy "cp /etc/haproxy/haproxy-prod.cfg /etc/haproxy/haproxy.cfg"

ssh -i /scripts/sshid-docker-internal -oStrictHostKeyChecking=no root@proxy "/usr/bin/supervisorctl restart haproxy"


