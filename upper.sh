#17que
#!/bin/bash

# Initialize the input and output file names to empty strings
in_file=""
out_file=""

# Parse the command-line options
while getopts "i:o:" opt; do
  case $opt in
    i)
      # Set the input file name
      in_file=$OPTARG
      ;;
    o)
      # Set the output file name
      out_file=$OPTARG
      ;;
    \?)
      # Print an error message and exit if an invalid option is provided
      echo "Error: Invalid option."
      echo "Usage: upper -i infile -o outfile"
      exit 1
      ;;
  esac
done

# Check if the input and output file names were provided
if [ -z "$in_file" ] || [ -z "$out_file" ]; then
  echo "Error: Missing input or output file name."
  echo "Usage: upper -i infile -o outfile"
  exit 1
fi

# Check if the input file exists and is a regular file
if [ ! -f "$in_file" ]; then
  echo "Error: $in_file is not a regular file."
  exit 1
fi

# Convert the characters of the input file to uppercase using the tr command
# The -d option deletes all characters that are not uppercase
# The -c option complements the set of characters (uppercase in this case)
# The [:lower:] character class matches all lowercase letters
# The `>` operator redirects the output to a new file
tr -d -c '[:upper:]' < "$in_file" > "$out_file"

echo "Conversion completed."
