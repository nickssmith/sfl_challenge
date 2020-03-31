#!/usr/bin/env bash
#set -x
set -e

INPUT_CSV="/home/nick/Git/sfl_challenge/Section_1/mock-data/alldata.csv"
DB_TO_USE="db"
DB_USER="user"
DB_PASSWORD="password"
DB_PORT=3306
DB_ADDRESS=127.0.0.1
# make the base command to do a sql querry using the database selected
BASE_CMD="mysql -u$DB_USER -h $DB_ADDRESS --port=$DB_PORT -p$DB_PASSWORD -D $DB_TO_USE"

# create the table to store the user data in
$BASE_CMD -e "create table if not exists users (username VARCHAR(20) PRIMARY KEY,password VARCHAR(20),role VARCHAR(20),projects VARCHAR(50),full_name VARCHAR(50),birthday DATE);"

# import all from the csv file minus the first line
i=1
while IFS=: read -r username password role projects full_name birthday
do
        test $i -eq 1 && ((i=i+1)) && continue
        # echo "insert into users (username,password,role,projects,full_name,birthday) VALUES ($username, $password, $role, $projects, $full_name, $birthday);"
        $BASE_CMD -e "insert into users (username,password,role,projects,full_name,birthday) VALUES ($username, $password, $role, $projects, $full_name, $birthday);"
done < $INPUT_CSV
