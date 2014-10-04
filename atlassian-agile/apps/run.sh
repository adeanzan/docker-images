#!/bin/bash
# Abort script if any command encounters an error
set -e

# Get dir where this script is located
DIR="$( cd "$( dirname "$0" )" && pwd )"
cd $DIR

docker run --rm -P --link atlassian-db:db zanco/atlassian-agile &
