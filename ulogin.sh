#!/bin/bash

# Check if the required number of arguments was provided
if [ $# -ne 2 ]; then
  echo "Error: Invalid number of arguments."
  echo "Usage: user_login username file"
  exit 1
fi

# Assign the username and file name to variables
username=$1
file=$2

# Check if the file already exists
if [ -f "$file" ]; then
  echo "Error: $file already exists."
  exit 1
fi

# Use the who command to count the number of times the user is logged in
# The -u option shows the users who are logged in
# The -q option suppresses the login names and displays only the counts
count=$(who -u -q | grep "$username" | awk '{print $2}')

# Write the result to the file
echo "$count" > "$file"

echo "Writing completed."
