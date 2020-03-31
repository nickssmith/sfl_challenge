#!/usr/bin/env bash
#set -x
set -e


# never used this before, but figured easiest way to do is similar to sql but with cypher-shell
# installed cypher shell from aur

INPUT_CSV="/home/nick/Git/sfl_challenge/Section_1/mock-data/alldata.csv"
NEO4J_USER="neo4j"
NEO4J_PASSWORD="test"

# import all from the csv file minus the first line and make a commands to execute file
i=1
while IFS=: read -r username password role projects full_name birthday; do
  test $i -eq 1 && ((i = i + 1)) && continue
  echo "CREATE($(echo $username | sed "s/'//g"):username{password: $password, role: $role, projects: $projects, full_name: $full_name, birthday: $birthday});" >> cmds.cypher
done <$INPUT_CSV

cat cmds.cypher | cypher-shell -u $NEO4J_USER -p $NEO4J_PASSWORD

rm cmds.cypher
