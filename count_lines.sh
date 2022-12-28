#!/bin/bash

# Check if the required number of arguments was provided
if [ $# -ne 2 ]; then
  echo "Error: Invalid number of arguments."
  echo "Usage: count_lines -i|-e file"
  exit 1
fi

# Assign the options and file name to variables
option=$1
file=$2

# Check the value of the option
if [ "$option" = "-i" ]; then
  # Count the number of lines that begin with the letter i
  count=$(grep "^i" "$file" | wc -l)
elif [ "$option" = "-e" ]; then
  # Count the number of lines that begin with the letter e
  count=$(grep "^e" "$file" | wc -l)
else
  # Print an error message if the option is not -i or -e
  echo "Error: Invalid option."
  exit 1
fi

# Print the result
echo "Number of lines that begin with $option: $count"