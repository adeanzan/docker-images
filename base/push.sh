#!/bin/bash
# Abort script if any command encounters an error
set -e

# Get dir where this script is located
DIR="$( cd "$( dirname "$0" )" && pwd )"
cd $DIR

VERSION="1.1.1"

docker tag -f zanconsulting/base:dev zanconsulting/base:latest
docker tag -f zanconsulting/base:dev zanconsulting/base:"${VERSION}"

docker push zanconsulting/base:latest
docker push zanconsulting/base:"${VERSION}"
