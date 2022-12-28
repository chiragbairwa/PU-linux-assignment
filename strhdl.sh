#!/bin/bash

# Define the functions
upper () {
  # Convert the characters of the input file to uppercase using the tr command
  # The -d option deletes all characters that are not uppercase
  # The -c option complements the set of characters (uppercase in this case)
  # The [:lower:] character class matches all lowercase letters
  # The `>` operator redirects the output to a new file
  tr -d -c '[:upper:]' < "$1" > "${1%.*}_uppercase.txt"
}

lower () {
  # Convert the characters of the input file to lowercase using the tr command
  # The -d option deletes all characters that are not lowercase
  # The -c option complements the set of characters (lowercase in this case)
  # The [:upper:] character class matches all uppercase letters
  # The `>` operator redirects the output to a new file
  tr -d -c '[:lower:]' < "$1" > "${1%.*}_lowercase.txt"
}

print () {
  # Print the contents of the input file using the cat command
  cat "$1"
}

# Initialize the function to an empty string
func=""

# Parse the command-line options
while getopts "u:l:p:" opt; do
  case $opt in
    u)
      # Set the function to upper
      func=upper
      ;;
