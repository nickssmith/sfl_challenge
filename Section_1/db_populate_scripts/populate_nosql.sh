#!/usr/bin/env bash
#set -x
set -e

INPUT_CSV="/home/nick/Git/sfl_challenge/Section_1/mock-data/alldata.csv"
MONGO_USER="root"
MONGO_PASSWORD="password"

cp mongo_cmds.js cmds.js

# import all from the csv file minus the first line and make a commands to execute file
i=1
while IFS=: read -r username password role projects full_name birthday; do
  test $i -eq 1 && ((i = i + 1)) && continue
  echo """db.users.insertOne(
          {
            username: $username,
            password: $password,
            role: $role,
            projects: $projects,
            full_name: $full_name,
            birthday: $birthday
          })""" >>cmds.js
done <$INPUT_CSV
# execute that file on the db
mongo -u $MONGO_USER -p $MONGO_PASSWORD <cmds.js

rm cmds.js
