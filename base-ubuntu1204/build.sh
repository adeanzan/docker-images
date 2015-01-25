#!/bin/bash
# Abort script if any command encounters an error
set -e
shopt -s expand_aliases

# Get dir where this script is located
DIR="$( cd "$( dirname "$0" )" && pwd )"
cd $DIR

docker --tls=true build --force-rm -t zanconsulting/base-ubuntu1204:1.0.0 .
