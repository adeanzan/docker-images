#!/bin/bash
# Abort script if any command encounters an error
set -e

# Get dir where this script is located
DIR="$( cd "$( dirname "$0" )" && pwd )"
cd $DIR

docker run --rm -P --name proxy --link app:app zanco/pmx-config-proxy &
#docker run --rm -P --name proxy zanco/pmx-config-proxy &
