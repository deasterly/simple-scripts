#!/bin/bash

# Use conditionals and tests
U=`whoami`  	#get current user
D=`pwd`		#get current directory

echo "This script should only be run by non-root users from their home directory."

if [ $U = 'root' ]; then
	echo "This script must NOT be run as root."
	exit 1 # WRONG USER
# If the previous condition was false we continue knowing we have a regular user
# We can use `elif` to then check our next condition, the $PWD
elif [ $D != $HOME ]; then
	echo "This script must be run from ${HOME}."
	exit 2 # WRONG PWD
# If the previous condition was FALSE that means our $PWD is our $HOME so we should continue
else
	echo "What to go, ${USER}! You ran $0 from ${D} and followed instructions correctly." 
 	# The {} around variable names ensures the variable name is not misinterpreted by including adjacent text
	# e.g., forgetting a space could lead to using the incorrect variable "$Dand" whereas "${D}and" will protect the variable 
fi
# $0 is a "positional parameter" that shows the command itself.
# Positional parameters for any arguments after the command would be $1 $2 $3 and so on.
# The total number of arguments is the $# parameter. 
# You can loop through all arguments with the $@ parameter.

exit 0	
