#!/bin/bash
# Abort script if any command encounters an error
set -e

# Get dir where this script is located
DIR="$( cd "$( dirname "$0" )" && pwd )"
cd $DIR

docker kill configurator
docker run --rm -P --name configurator --link proxy:proxy --link app:app zanco/pmx-config-configurator &
#docker run --rm -P --name configurator zanco/pmx-config-configurator &
