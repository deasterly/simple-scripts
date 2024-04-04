# simple-scripts

These are simple example BASH shell scripts to get you started

<pre>

[student@workstation bin]$ nl script1.sh 
     1	#!/bin/bash      
     2	# Initial bash script with a variable
     3	STRING="Hello world"
     4	echo ${STRING}
       
[student@workstation bin]$ nl script2.sh 
     1	#!/bin/bash
     2	# Second demo script to get info from user
     3	echo -n "Enter your name: "
     4	read N
     5	echo "Hello, ${N}."
[student@workstation bin]$ nl script3.sh 
     1	#!/bin/bash
     2	# Use more variables
     3	NOW=$(date +%s)  # Gives seconds since the start of UNIX time
     4	TODAY=$(date +%D) 
     5	TOMORROW=$(date -d +1day +%D)
       
     6	echo "Welcome, ${USERNAME}."
     7	echo "Today's date is ${TODAY} and tomorrow will be ${TOMORROW}."
     8	echo "${NOW} seconds have passed since midnight UTC, Jan 1, 1970."
       
     9	# Let's also include an exit status 
    10	exit 0
[student@workstation bin]$ nl script4.sh 
     1	#!/bin/bash       
     2	# Use conditionals and tests
       
     3	if [ $USER != "root" ] ; then 
     4		echo "Hello, ${USER}."
     5		exit 0
     6	else
     7		echo "Greetings, Administrator."
     8		echo "This command isn't for you."
     9		exit 1 
    10		# Any exit status other than 0 is considered an error 
    11		# View the previous command's exit status with `echo $?`
    12	fi
[student@workstation bin]$ nl script5.sh 
     1	#!/bin/bash
     2	# Use conditionals and tests
     3	U=`whoami`  	#get current user
     4	D=`pwd`		#get current directory
       
     5	echo "This script should only be run by non-root users from their home directory."
       
     6	if [ $U = 'root' ]; then
     7		echo "This script must NOT be run as root."
     8		exit 1 # WRONG USER
     9	elif [ $D != $HOME ]; then
    10		echo "This script must be run from ${HOME}."
    11		exit 2 # WRONG PWD
    12	else
    13		echo "What to go, ${USER}! You ran $0 from $D and followed instructions correctly."
    14	fi
    15	# $0 is a "positional parameter" that shows the command itself.
    16	# Positional parameters for any arguments after the command would be $1 $2 $3 and so on.
    17	# The total number of arguments is the $# parameter. 
    18	# You can loop through all arguments with the $@ parameter.
       
    19	exit 0
[student@workstation bin]$ nl script6.sh 
     1	#!/bin/bash       
     2	# Use a case statement
     3	# This example is taken from /usr/share/doc/bash/bashref.html
       
     4	echo -n "Enter the name of an animal: "
     5	read ANIMAL
     6	echo -n "The ${ANIMAL} has "
       
     7	case $ANIMAL in
       
     8		horse | dog | cat)
     9			echo -n "four";;
       
    10		man | kangaroo)
    11			echo -n "two";;
       
    12		spider | tick)
    13			echo -n "eight";;
       
    14		*)
    15			echo -n "an unknown number of";;
    16	esac
    17	echo " legs."
[student@workstation bin]$ nl script7.sh 
     1	#!/bin/bash
     2	# Use a case statement and positional parameters
     3	ANIMAL=$1
     4	if [ $# -gt 1 ]; then
     5		echo "This command accepts only 1 argument."
     6		echo "Usage:  $0 <ANIMAL>"
     7		exit 1 # TOO MANY ARGS
     8	elif [ $# -eq 0 ]; then
     9		echo -n "Enter the name of an animal: "
    10		read ANIMAL
    11	fi
       
    12	echo -n "The ${ANIMAL} has "
    13	case $ANIMAL in
       
    14		horse | dog | cat)
    15			echo -n "four";;
       
    16		man | kangaroo)
    17			echo -n "two";;
       
    18		spider | tick)
    19			echo -n "eight";;
       
    20		*)
    21			echo -n "an unknown number of";;
    22	esac
    23	echo " legs."
[student@workstation bin]$ nl script8.sh 
     1	#!/bin/bash
     2	# Loop through positional parameters
       
     3	if [ $# -eq 0 ]; then
     4		echo "$0 requires 1 or more arguments."
     5		exit 1 # NO ARGS
     6	fi
       
     7	if [ $# -eq 1 ]; then
     8		echo "The only argument was $1"
     9	else
    10		for V in $@; do
    11			echo "This iteration the argument was $V"
    12		done
    13	fi
       
    14	exit 0
       
     </pre>
