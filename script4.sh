#!/bin/bash

# Use conditionals and tests

# Open conditional with `if` and close the conditional with if backwards - `fi`
# Tests are inside the square brackets - see `help test` to get started
if [ $USER != "root" ] ; then 
	echo "Hello, ${USER}."
	exit 0
# If the previous condition is TRUE the script ends without error
# We use `else` as a "catchall" if previous conditions are all FALSE
else
	echo "Greetings, Administrator."
	echo "This command isn't for you."
	exit 1 
	# Any exit status other than 0 is considered an error 
	# View the previous command's exit status with `echo $?`
fi
