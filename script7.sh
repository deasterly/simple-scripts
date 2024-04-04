#!/bin/bash
# Use a case statement and positional parameters
ANIMAL=$1
if [ $# -gt 1 ]; then
	echo "This command accepts only 1 argument."
	echo "Usage:  $0 <ANIMAL>"
	exit 1 # TOO MANY ARGS
elif [ $# -eq 0 ]; then
	echo -n "Enter the name of an animal: "
	read ANIMAL
fi

echo -n "The ${ANIMAL} has "
case $ANIMAL in

	horse | dog | cat)
		echo -n "four";;

	man | kangaroo)
		echo -n "two";;

	spider | tick)
		echo -n "eight";;

	*)
		echo -n "an unknown number of";;
esac
echo " legs."
