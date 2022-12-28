#!/bin/bash

# Check if the required number of arguments was provided
if [ $# -ne 2 ]; then
  echo "Error: Invalid number of arguments."
  echo "Usage: gcd number1 number2"
  exit 1
fi

# Assign the input numbers to variables
num1=$1
num2=$2

# Use a loop to find the GCD
while [ "$num2" -ne 0 ]; do
  # Calculate the remainder of the division of num1 by num2
  remainder=$((num1 % num2))
  
  # Set num1 to num2 and num2 to the remainder
  num1=$num2
  num2=$remainder
done

# Print the GCD
echo "The GCD is: $num1"