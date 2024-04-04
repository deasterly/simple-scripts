#!/bin/bash

# Use conditionals and tests
U=`whoami`  	#get current user
D=`pwd`		#get current directory

echo "This script should only be run by non-root users from their home directory."

if [ $U = 'root' ]; then
	echo "This script must NOT be run as root."
	exit 1 # WRONG USER
elif [ $D != $HOME ]; then
	echo "This script must be run from ${HOME}."
	exit 2 # WRONG PWD
else
	echo "What to go, ${USER}! You ran $0 from $D and followed instructions correctly."
fi
# $0 is a "positional parameter" that shows the command itself.
# Positional parameters for any arguments after the command would be $1 $2 $3 and so on.
# The total number of arguments is the $# parameter. 
# You can loop through all arguments with the $@ parameter.

exit 0	
