#!/bin/bash
# Loop through positional parameters

# In addition to using $0 for the script itself and $1 or $2 and so on for arguments we have two more useful paramaters
# We use $# to get the total number of arguments from the command line
# We use $@ to list all the positional parameters' values in order, based on the command line arguments

if [ $# -eq 0 ]; then
	echo "$0 requires 1 or more arguments."
	exit 1 # NO ARGS
fi

if [ $# -eq 1 ]; then
	echo "The only argument was $1"
else
        for V in $@; do
                echo "This iteration the argument sets the value of V to $V"
        done
	echo 'Running `echo $@` returns the list used as values for $V in the `for` loop above.'
	echo $@

fi

exit 0
