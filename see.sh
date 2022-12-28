#!/bin/bash

# Check if a filename was provided as an argument
if [ $# -eq 0 ]; then
  echo "Error: No filename provided."
  exit 1
fi

# Check if the file is a directory
if [ -d "$1" ]; then
  # List the contents of the directory
  ls "$1"
else
  # Display the contents of the file
  more "$1"
fi
