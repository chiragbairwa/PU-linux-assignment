#!/bin/bash

# Check if the dialog utility is installed
if ! [ -x "$(command -v dialog)" ]; then
  # If the dialog utility is not installed, use the echo command to print the message
  echo "Error: The dialog utility is not installed."
  exit 1
fi

# Get the current hour
hour=$(date +%H)

# Set the greeting message according to the time of day
if [ "$hour" -ge 0 ] && [ "$hour" -lt 12 ]; then
  # Good morning
  message="Good Morning"
elif [ "$hour" -ge 12 ] && [ "$hour" -lt 18 ]; then
  # Good afternoon
  message="Good Afternoon"
else
  # Good evening
  message="Good Evening"
fi

# Display the greeting message in an infobox using the dialog utility
dialog --title "Greeting" --msgbox "$message" 10 40
