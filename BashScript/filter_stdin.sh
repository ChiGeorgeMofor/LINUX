#!/bin/bash

# Check if input is provided via STDIN
if [ -t 0 ]; then
	echo "No input provided, Please provide input via STDIN."
	exit 1
fi
   
# Filter and format the output
awk '{print $9, $5, $3}'
