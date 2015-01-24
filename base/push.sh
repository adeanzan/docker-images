#!/bin/bash
# Abort script if any command encounters an error
set -e

# Get dir where this script is located
DIR="$( cd "$( dirname "$0" )" && pwd )"
cd $DIR

docker tag zanconsulting/base:1.0.1 zanconsulting/base:latest
docker push zanconsulting/base:1.0.1
