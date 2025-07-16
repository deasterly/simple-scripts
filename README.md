# simple-scripts

These are simple example BASH shell scripts to get you started.

Run `git clone https://github.com/deasterly/simple-scripts` to get a copy of these files.

Next run `chmod -v +x ./simple-scripts/*.sh` to try them out.


<pre>
$ nl add_users.sh

     1	#!/bin/bash
       
     2	# Add multiple users from a list and set a default password 
       
     3	for U in john paul george ringo ; do
     4		sudo useradd --comment $U --groups wheel  $U 
     5		echo 'LinuxRules123!' | sudo passwd --stdin $U
     6	done
       

$ nl script1.sh

     1	#!/bin/bash
       
     2	# Initial bash script with a variable
       
     3	STRING="Hello world"
       
     4	echo ${STRING}
       

$ nl script2.sh

     1	#!/bin/bash
       
     2	# Second demo script to get info from user
       
     3	echo -n "Enter your name: "
     4	read N
       
     5	echo "Hello, ${N}."

$ nl script3.sh

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

$ nl script4.sh

     1	#!/bin/bash
       
     2	# Use conditionals and tests
       
     3	# Open conditional with `if` and close the conditional with if backwards - `fi`
     4	# Tests are inside the square brackets - see `help test` to get started
     5	if [ $USER != "root" ] ; then 
     6		echo "Hello, ${USER}."
     7		exit 0
     8	# If the previous condition is TRUE the script ends without error
     9	# We use `else` as a "catchall" if previous conditions are all FALSE
    10	else
    11		echo "Greetings, Administrator."
    12		echo "This command isn't for you."
    13		exit 1 
    14		# Any exit status other than 0 is considered an error 
    15		# View the previous command's exit status with `echo $?`
    16	fi

$ nl script5.sh

     1	#!/bin/bash
       
     2	# Use conditionals and tests
     3	U=`whoami`  	#get current user
     4	D=`pwd`		#get current directory
       
     5	echo "This script should only be run by non-root users from their home directory."
       
     6	if [ $U = 'root' ]; then
     7		echo "This script must NOT be run as root."
     8		exit 1 # WRONG USER
     9	# If the previous condition was FALSE we continue, knowing we have a regular user
    10	# We can use `elif` to then check our next condition, is the $PWD also their $HOME
    11	elif [ $D != $HOME ]; then
    12		echo "This script must be run from ${HOME}."
    13		exit 2 # WRONG PWD
    14	# If the previous condition was FALSE that means our $PWD is our $HOME so we should continue
    15	else
    16		echo "What to go, ${USER}! You ran $0 from ${D} and followed instructions correctly." 
    17	 	# The {} around variable names ensures the variable name is not misinterpreted by including adjacent text
    18		# e.g., missing a space could lead to using the incorrect variable "$Dand" whereas "${D}and" will protect the variable 
    19	fi
    20	# $0 is a "positional parameter" that shows the command itself.
    21	# Positional parameters for any arguments after the command would be $1 $2 $3 and so on.
    22	# The total number of arguments is the $# parameter. 
    23	# You can loop through all arguments with the $@ parameter.
       
    24	exit 0	

$ nl script6.sh

     1	#!/bin/bash
       
     2	# Use a case statement
     3	# This example is taken from /usr/share/doc/bash/bashref.html
       
     4	echo -n "Enter the name of an animal: "
     5	read ANIMAL
     6	echo -n "The ${ANIMAL} has "
       
     7	# We can use `case` similar to if/then;elif/then; and else 
     8	# See `help case` for an explanation of the syntax
     9	case $ANIMAL in
       
    10		horse | dog | cat)
    11			echo -n "four";;
    12			# If this condition is matched, we exit the `case/esac` and continue onwards
    13		man | kangaroo)
    14			echo -n "two";;
    15			# This second condition is similar to an `elif` 
    16		spider | tick)
    17			echo -n "eight";;
    18			# This is like another `elif`
    19		*)
    20			echo -n "an unknown number of";;
    21	  		# The *) in `case/esac` is a "catchall" condition similar to `else`
    22	esac
    23	# Close with case backwards to end the conditional
       
    24	echo " legs."
       
$ nl script7.sh

     1	#!/bin/bash
     2	# Use a case statement and positional parameters and include some "defensive" logic
     3	# This expands on the example take from /usr/share/doc/bash/bashref.html
       
     4	ANIMAL=$1
     5	# Defensive logic protects against your script being used incorrectly
     6	# This example first checks if the user added too many arguments after the script
     7	if [ $# -gt 1 ]; then
     8		echo "This command accepts only 1 argument."
     9		echo "Usage:  $0 <ANIMAL>"
    10		exit 1 # TOO MANY ARGS
    11	elif [ $# -eq 0 ]; then
    12		echo -n "Enter the name of an animal: "
    13		read ANIMAL
    14		# This `elif` addresses what to do if the user did not include any argument after the script to set ${ANIMAL}'s value
    15	fi
    16	# If both of the tests in our `if/elif` above are FALSE that means the first and only argument after the script (the $1 parameter) was used to set ${ANIMAL}'s value
    17	# Now $0 works differently depend on whether we have zero, one, or more arguments after the script
       
    18	echo -n "The ${ANIMAL} has "
    19	case $ANIMAL in
       
    20		horse | dog | cat)
    21			echo -n "four";;
       
    22		man | kangaroo)
    23			echo -n "two";;
       
    24		spider | tick)
    25			echo -n "eight";;
       
    26		*)
    27			echo -n "an unknown number of";;
    28	esac
    29	echo " legs."

$ nl script8.sh

     1	#!/bin/bash
     2	# Loop through positional parameters
       
     3	# In addition to using $0 for the script itself and $1 or $2 and so on for arguments we have two more useful paramaters
     4	# We use $# to get the total number of arguments from the command line
     5	# We use $@ to list all the positional parameters' values in order, based on the command line arguments
       
     6	if [ $# -eq 0 ]; then
     7		echo "$0 requires 1 or more arguments."
     8		exit 1 # NO ARGS
     9	fi
       
    10	if [ $# -eq 1 ]; then
    11		echo "The only argument was $1"
    12	else
    13	        for V in $@; do
    14	                echo "This iteration the argument sets the value of V to $V"
    15	        done
    16            echo 'Running `echo $@` returns the list used as values for $V in the `for` loop above.'
    17	        echo $@
    18	fi
           
    19	exit 0

</pre>
