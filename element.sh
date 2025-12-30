#! /bin/bash

PSQL="psql --username=freecodecamp --dbname=periodic_table -t --no-align -c"

if [[ -z $1 ]]
then
  echo "Please provide an element as an argument."
  exit
fi

ELEMENT=$1

if [[ $ELEMENT =~ ^[0-9]+$ ]]
then
  QUERY="e.atomic_number=$ELEMENT"
else
  QUERY="e.symbol='$ELEMENT' OR e.name='$ELEMENT'"
fi

RESULT=$($PSQL "
SELECT e.atomic_number, e.name, e.symbol, t.type,
p.atomic_mass, p.melting_point_celsius, p.boiling_point_celsius
FROM elements e
JOIN properties p USING(atomic_number)
JOIN types t USING(type_id)
WHERE $QUERY
")

if [[ -z $RESULT ]]
then
  echo "I could not find that element in the database."
  exit
fi

echo "$RESULT" | while IFS="|" read AN NAME SYMBOL TYPE MASS MELT BOIL
do
  echo "The element with atomic number $AN is $NAME ($SYMBOL). It's a $TYPE, with a mass of $MASS amu. $NAME has a melting point of $MELT celsius and a boiling point of $BOIL celsius."
done
