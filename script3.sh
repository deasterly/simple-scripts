#!/bin/bash

# Use more variables

NOW=$(date +%s)  # Gives seconds since the start of UNIX time
TODAY=$(date +%D) 
TOMORROW=$(date -d +1day +%D)

echo "Welcome, ${USERNAME}."
echo "Today's date is ${TODAY} and tomorrow will be ${TOMORROW}."
echo "${NOW} seconds have passed since midnight UTC, Jan 1, 1970."

# Let's also include an exit status 
exit 0
