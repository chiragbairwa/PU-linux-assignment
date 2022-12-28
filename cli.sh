#!/bin/bash

# Check if any argument was provided
if [ $# -eq 0 ]; then
  echo "Error: No arguments provided."
  echo "Usage: list_args arg1 [arg2...]"
  exit 1
fi

# Loop through the arguments
for (( i=1; i<=$#; i++ )); do
  # Print the i-th argument
  echo "Argument $i: ${!i}"
done
