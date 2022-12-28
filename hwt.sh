#!/bin/bash

# Check if a user ID was provided as an argument
if [ $# -eq 0 ]; then
  echo "Error: No user ID provided."
  exit 1
fi

# Get the number of times the user is logged on
logins=$(who | grep "^$1 " | wc -l)

echo "User $1 is logged on $logins time(s)."
