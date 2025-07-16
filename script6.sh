#!/bin/bash

# Use a case statement
# This example is taken from /usr/share/doc/bash/bashref.html

echo -n "Enter the name of an animal: "
read ANIMAL
echo -n "The ${ANIMAL} has "

# We can use `case` similar to if/then;elif/then; and else 
# See `help case` for an explanation of the syntax
case $ANIMAL in

	horse | dog | cat)
		echo -n "four";;
		# If this condition is matched, we exit the `case/esac` and continue onwards
	man | kangaroo)
		echo -n "two";;
		# This second condition is similar to an `elif` 
	spider | tick)
		echo -n "eight";;
		# This is like another `elif`
	*)
		echo -n "an unknown number of";;
  		# The *) in `case/esac` is a "catchall" condition similar to `else`
esac
# Close with case backwards to end the conditional

echo " legs."

