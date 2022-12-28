#!/bin/bash

# Check if a 5-digit number was provided as an argument
if [ $# -ne 1 ] || [ "${#1}" -ne 5 ]; then
  echo "Error: Invalid number."
  echo "Usage: reverse_number number"
  exit 1
fi

# Assign the input number to a variable
num=$1

# Initialize the reversed number to an empty string
rev=""

# Loop through the digits of the input number
for (( i=${#num}; i>0; i-- )); do
  # Extract the i-th digit from the input number
  digit=${num:i-1:1}
  
  # Add the digit to the reversed number
  rev="$rev$digit"
done

# Print the reversed number
echo "The reversed number is: $rev"
