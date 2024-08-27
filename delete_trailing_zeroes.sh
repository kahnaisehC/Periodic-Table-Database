PSQL="psql --username=freecodecamp --dbname=periodic_table --tuples-only -c"
#read atomic mass
cat ../atomic_mass.txt | while read ATOMIC_NUMBER BAR ATOMIC_MASS
do
  if [[ $ATOMIC_NUMBER == "atomic_number" ]]
  then
    continue
  fi
  #update properties table
  UPDATE_ATOMIC_MASS_RESULT=$($PSQL "UPDATE properties SET new_atomic_mass = $ATOMIC_MASS WHERE atomic_number=$ATOMIC_NUMBER")

done