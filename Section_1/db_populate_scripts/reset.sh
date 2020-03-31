#!/usr/bin/env bash
#set -x
#set -e


# mysql
DB_TO_USE="db"
DB_USER="user"
DB_PASSWORD="password"
DB_PORT=3306
DB_ADDRESS=127.0.0.1
# make the base command to do a sql querry
BASE_CMD="mysql -u$DB_USER -h $DB_ADDRESS --port=$DB_PORT -p$DB_PASSWORD -D $DB_TO_USE"

$BASE_CMD -e "show tables;"
$BASE_CMD -e "drop table users;"
$BASE_CMD -e "show tables;"



# mongo
mongo -u root -p password < mongo_cmds_reset.js


#graph

#TODO