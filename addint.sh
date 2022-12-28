#!/bin/bash

# Initialize the sum to 0
sum=0

# Use a loop to add the numbers from 1 to 10
for (( i=1; i<=10; i++ )); do
  # Add the current number to the sum
  sum=$((sum + i))
done

# Print the sum
echo "The sum of the first 10 integers is: $sum"
