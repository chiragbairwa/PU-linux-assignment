#!/bin/bash

# Check if a string was provided as an argument
if [ $# -ne 1 ]; then
  echo "Error: No string provided."
  echo "Usage: is_palindrome string"
  exit 1
fi

# Assign the input string to a variable
str=$1

# Initialize the flag to true
is_palindrome=true

# Loop through the characters of the string
for (( i=0; i<${#str}/2; i++ )); do
  # Extract the i-th and (n-i-1)-th characters from the string
  char1=${str:i:1}
  char2=${str:${#str}-i-1:1}
  
  # Compare the characters
  if [ "$char1" != "$char2" ]; then
    # If they are different, set the flag to false and exit the loop
    is_palindrome=false
    break
  fi
done

# Print the result
if $is_palindrome; then
  echo "The string is a palindrome."
else
  echo "The string is not a palindrome."
fi
