#!/bin/bash
# Abort script if any command encounters an error
set -e

# Get dir where this script is located
DIR="$( cd "$( dirname "$0" )" && pwd )"
cd $DIR

# To initialize database
#docker run -d -v /path/in/host:/var/lib/mysql zanco/atlassian-mysql /bin/bash -c "/usr/bin/mysql_install_db"

# To run without persistent data
#docker run --rm -P --name atlassian-db zanco/atlassian-mysql &

# To run with persistent data
docker run --rm -P --name atlassian-db -v /storage/mysql2:/var/lib/mysql zanco/atlassian-mysql &
