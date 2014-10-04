#!/bin/bash

echo "** Running database setup "


# Create databases for jira apps
mysql -u root -e "CREATE DATABASE if not exists jira CHARACTER SET utf8 COLLATE utf8_bin;"

# Create mysql account for atlassian apps
mysql -u root -e "GRANT SELECT,INSERT,UPDATE,DELETE,CREATE,DROP,ALTER,INDEX on jira.* TO 'atlassian'@'%' IDENTIFIED BY 'atlassian'"

# Done, flush privileges
mysql -u root -e "flush privileges"

echo "** Done."
