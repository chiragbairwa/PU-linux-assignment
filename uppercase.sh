#!/bin/bash

# Check if any file was provided as an argument
if [ $# -eq 0 ]; then
  echo "Error: No files provided."
  echo "Usage: uppercase file1 [file2...]"
  exit 1
fi

# Loop through the input files
for file in "$@"; do
  # Check if the file exists and is a regular file
  if [ ! -f "$file" ]; then
    echo "Error: $file is not a regular file."
    continue
  fi
  
  # Convert the letters of the file to uppercase using the tr command
  # The -d option deletes all characters that are not uppercase
  # The -c option complements the set of characters (uppercase in this case)
  # The [:lower:] character class matches all lowercase letters
  # The `>` operator redirects the output to a new file
  tr -d -c '[:upper:]' < "$file" > "${file%.*}.caps"
done

echo "Conversion completed."
