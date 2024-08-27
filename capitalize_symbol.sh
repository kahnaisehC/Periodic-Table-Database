<<com
This is the syntax for capitalizing first letter
VAR="something"

VAR1=${VAR^}

echo $VAR1
com

PSQL="psql --username=freecodecamp --dbname=periodic_table --tuples-only -c"

#get Symbol
echo "$($PSQL "SELECT atomic_number, symbol FROM elements")" | while read ATOMIC_NUMBER BAR SYMBOL
do
  echo "$ATOMIC_NUMBER) is $SYMBOL"
#Capitalize Symbol
  SYMBOL_CAPITALIZED=${SYMBOL^}
  echo "$SYMBOL_CAPITALIZED"
#update Symbol
  UPDATE_SYMBOL_RESULT=$($PSQL "UPDATE elements SET symbol = '$SYMBOL_CAPITALIZED' WHERE atomic_number=$ATOMIC_NUMBER")


done
