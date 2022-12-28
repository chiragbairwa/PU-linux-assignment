#!/bin/bash

# Check if a string was provided as an argument
if [ $# -ne 1 ]; then
  echo "Error: No text provided."
  echo "Usage: count_text text"
  exit 1
fi

# Assign the input text to a variable
text=$1

# Initialize the counters
char_count=0
space_count=0
word_count=0
tab_count=0

# Loop through the characters of the text
for (( i=0; i<${#text}; i++ )); do
  # Extract the i-th character from the text
  char=${text:i:1}
  
  # Increment the character count
  char_count=$((char_count + 1))
  
  # Check if the character is a white space, word, or tab
  if [ "$char" = " " ]; then
    # Increment the space count
    space_count=$((space_count + 1))
  elif [ "$char" = $'\t' ]; then
    # Increment the tab count
    tab_count=$((tab_count + 1))
  elif [ "$char" != " " ] && [ "$char" != $'\t' ]; then
    # Increment the word count
    word_count=$((word_count + 1))
  fi
done

# Print the results
echo "Number of characters: $char_count"
echo "Number of white spaces: $space_count"
echo "Number of words: $word_count"
echo "Number of tabs: $tab_count"