#!/bin/bash 
  
# Checking if there are any arguments
if [ "$#" -eq 0 ]; then 
	echo "No arguments provided." 
	exit 1
fi 
      
# Get the number of arguments 
num_args="$#"
echo "Number of arguments: $num_args"

# Access the arguments
echo "First argument: $1"
echo "Second argument: $2"

# Loop through all arguments
echo "All arguments:"
for arg in "$@"; do
	echo "- $arg"
done
