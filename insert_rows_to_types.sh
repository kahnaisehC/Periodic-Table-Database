PSQL="psql --username=freecodecamp --dbname=periodic_table --tuples-only -c"

#get type from properties
echo "$($PSQL "SELECT type FROM properties")" | while read TYPE
do
  #if not in types
  SELECT_TYPE_RESULT=$($PSQL "SELECT type FROM types WHERE type = '$TYPE'")
  if [[ -z $SELECT_TYPE_RESULT ]]
  then
    echo "Type: $TYPE not found"
    #add to types
    INSERT_INTO_TYPES_RESULT=$($PSQL "INSERT INTO types(type) VALUES('$TYPE')")
  fi

done