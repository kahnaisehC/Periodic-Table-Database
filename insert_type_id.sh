PSQL="psql --username=freecodecamp --dbname=periodic_table --tuples-only -c"

echo "$($PSQL "SELECT atomic_number, type FROM properties")" | while read ATOMIC_NUMBER BAR TYPE
do
  echo "$ATOMIC_NUMBER is a $TYPE"
  #get id of type
  TYPE_ID=$($PSQL "SELECT type_id FROM types WHERE type = '$TYPE'")
  echo $TYPE_ID

  #update type_id on props
  UPDATE_TYPE_ID_RESULT=$($PSQL "UPDATE properties SET type_id='$TYPE_ID' WHERE atomic_number = '$ATOMIC_NUMBER'")
  
done