#!/bin/bash

# Check if a directory was provided as an argument
if [ $# -eq 0 ]; then
  # If no argument was provided, use the current directory
  dir=.
else
  dir=$1
fi

# Use the `find` command to search for regular files in the specified directory
# The `-type f` option searches for regular files (excluding directories and other special files)
# The `-exec` option executes the command given by the `du` command on each file
# The `-c` option displays a total sum of the sizes of the files
# The `-b` option displays the sizes in bytes
find "$dir" -type f -exec du -c -b {} + | grep total
