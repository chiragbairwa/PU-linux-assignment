#!/bin/bash

# Check if the required number of arguments was provided
if [ $# -ne 2 ]; then
  echo "Error: Invalid number of arguments."
  echo "Usage: cpi source destination"
  exit 1
fi

# Check if the destination file already exists
if [ -f "$2" ]; then
  # Prompt the user for confirmation
  read -p "File $2 already exists. Overwrite? [y/n] " answer
  
  # Check the user's answer
  if [ "$answer" != "y" ]; then
    # If the user did not confirm, exit the script
    echo "Operation cancelled."
    exit 0
  fi
fi

# Copy the file
cp "$1" "$2"

echo "File copied successfully."
