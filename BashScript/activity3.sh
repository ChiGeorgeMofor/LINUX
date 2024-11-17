#!/bin/bash
  
# Activity that will take a filename as its first argument and create a dated copy of the file
  
# Check if a filename argument was provided
if [ $# -ne 1 ]; then
	echo "Usage: $0 <filename>"
	exit 1 
fi

# Get the original filename from the first argument
original_file="$1"

# Checks if the file exists
if [ ! -f "$original_file" ]; then
	echo "File '$original_file' not found."
	exit 1
fi

# Get the current date in YYYY-MM-DD format
current_date=$(date +"%Y-%m-%d")

# Extract the base name and extension from the original file
base_name=$(basename "$original_file")
file_extension="${base_name##*.}"
file_name="${base_name%.*}"

# Construct the new filename
new_file="${file_name}.${file_extension}_${current_date}"

# Copy the original file to the new filename
cp "$original_file" "$new_file"

# Confirm success
if [ $? -eq 0 ]; then
	echo "File copied to '$new_file'."
else
	echo "Failed to copy file."
	exit 1
fi
