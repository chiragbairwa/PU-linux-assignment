#!/bin/bash

# Check if at least 15 arguments were provided
if [ $# -lt 15 ]; then
  echo "Error: Not enough arguments."
  echo "Usage: fifteen arg1 arg2...arg15"
  exit 1
fi

# Print the 15th argument
echo "The 15th argument is: $15"
