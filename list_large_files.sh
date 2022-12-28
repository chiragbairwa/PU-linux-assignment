#!/bin/sh

# Check if a number was provided as an argument
if [ $# -ne 1 ]; then
  echo "Error: No number provided."
  echo "Usage: list_large_files number"
  exit 1
fi

# Assign the number to a variable
x=$1

# Use the find command to list the files in the current directory
# The -type f option lists only regular files
# The -size +xc option lists only files larger than x bytes
# The -printf '%s %p\n' option prints the size and name of each file
find . -type f -size +"$x"c -printf '%s %p\n'