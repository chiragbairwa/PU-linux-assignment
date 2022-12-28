#!/bin/bash

# Check if the required number of arguments was provided
if [ $# -ne 3 ]; then
  echo "Error: Invalid number of arguments."
  echo "Usage: find_largest number1 number2 number3"
  exit 1
fi

# Assign the input numbers to variables
num1=$1
num2=$2
num3=$3

# Initialize the largest number to the first input number
largest=$num1

# Compare the second and third input numbers to the largest number
# If either of them is larger, update the value of the largest number
if [ "$num2" -gt "$largest" ]; then
  largest=$num2
fi
if [ "$num3" -gt "$largest" ]; then
  largest=$num3
fi

# Print the largest number
echo "The largest number is: $largest"
