#!/bin/bash

# Use a case statement
# This example is taken from /usr/share/doc/bash/bashref.html

echo -n "Enter the name of an animal: "
read ANIMAL
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

