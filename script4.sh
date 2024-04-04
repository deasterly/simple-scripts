#!/bin/bash

# Use conditionals and tests

if [ $USER != "root" ] ; then 
	echo "Hello, ${USER}."
	exit 0
else
	echo "Greetings, Administrator."
	echo "This command isn't for you."
	exit 1 
	# Any exit status other than 0 is considered an error 
	# View the previous command's exit status with `echo $?`
fi
