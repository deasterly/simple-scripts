#!/bin/bash
# Use a case statement and positional parameters and include some "defensive" logic
# This expands on the example take from /usr/share/doc/bash/bashref.html

ANIMAL=$1
# Defensive logic protects against your script being used incorrectly
# This example first checks if the user added too many arguments after the script
if [ $# -gt 1 ]; then
	echo "This command accepts only 1 argument."
	echo "Usage:  $0 <ANIMAL>"
	exit 1 # TOO MANY ARGS
elif [ $# -eq 0 ]; then
	echo -n "Enter the name of an animal: "
	read ANIMAL
	# This `elif` addresses what to do if the user did not include any argument after the script to set ${ANIMAL}'s value
fi
# If both of the tests in our `if/elif` above are FALSE that means the first and only argument after the script (the $1 parameter) was used to set ${ANIMAL}'s value
# Now $0 works differently depend on whether we have zero, one, or more arguments after the script

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
