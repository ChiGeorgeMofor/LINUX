#!/bin/bash
 
# Check if exactly one argument is provided
if [ $# -ne 1 ]; then
	echo "Usage: $0 <directory>"
	exit 1
fi
# Get the directory from the command line argument
dir=$1

# Check if the provided argument is a valid directory
if [ ! -d "$dir" ]; then
	echo "Error: '$dir' is not a valid directory."
	exit 1
fi

# Loop through each entry in the directory
for entry in "$dir"/*; do
	# Check if the entry is a file
	if [ -f "$entry" ]; then
		size=$(stat -c%s "$entry")
		echo "$(basename "$entry") is a file with size $size bytes"
	# Check if the entry is a director
	elif [ -d "$entry" ]; then
		count=$(ls -1 "$entry" | wc -l)
		echo "$(basename "$entry") is a directory with $count istems"
	else
		echo "$(basename "$entry") is neither a file nor a directory"
	fi
done
