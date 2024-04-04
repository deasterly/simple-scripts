#!/bin/bash
# Loop through positional parameters

if [ $# -eq 0 ]; then
	echo "$0 requires 1 or more arguments."
	exit 1 # NO ARGS
fi

if [ $# -eq 1 ]; then
	echo "The only argument was $1"
else
	for V in $@; do
		echo "This iteration the argument was $V"
	done
fi

exit 0
