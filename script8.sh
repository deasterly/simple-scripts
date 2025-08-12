#!/bin/bash
# Loop through positional parameters

DIV='------------------------------------------------'
# In addition to using $0 for the script itself and $1 or $2 and so on for arguments we have two more useful parameters
# We use $# to get the total number of arguments from the command line
# We use $@ to list all the positional parameters' values in order, based on the command line arguments

echo "Here are the contents of the script $0"
echo "We will pause 30 seconds before running the rest of the script..."
echo $DIV
nl $0  # This is what you are looking at with the line numbers...
echo $DIV
sleep 30  # Here is our 30 second pause...

# Let's do the rest of the script now that we've had time to review it...
if [ $# -eq 0 ]; then
        echo "$0 requires 1 or more arguments."
        exit 1 # NO ARGS
fi

if [ $# -eq 1 ]; then
        echo "The only argument was $1"
else
        for V in $@; do
                echo "This iteration the value of V equals $V"
        done
		echo $DIV
        echo 'Running `echo $@` returns the list of arguments used to set values for $V in the `for` loop above.'
        echo ; echo $@

fi
exit 0
