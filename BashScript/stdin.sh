#!/bin/bash
  
# Script to print the 3rd line from STDIN

# Check if input is provided via STDIN 
if [ -t 0]; then
	echo "No input provided. Please provide input via STDIN."
	exit 1
fi

# Print the 3rd line of the input
awk 'NR==3' # NR-Number of Records
