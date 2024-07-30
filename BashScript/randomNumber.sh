#!/bin/bash

# Check if at least one argument is provided
if [ "$#" -lt 1 ]; then
    echo "Usage: $0 <upper_limit> [lower_limit]"
    exit 1
fi

# Assign command-line arguments to variables
upper_limit=$1
lower_limit=${2:-0}

# Validate if upper_limit and lower_limit are integers
if ! [[ "$upper_limit" =~ ^[0-9]+$ ]] || ! [[ "$lower_limit" =~ ^[0-9]+$ ]]; then
    echo "Both upper and lower limits must be integers."
    exit 1
fi

# Validate if upper_limit is greater than lower_limit
if [ "$upper_limit" -le "$lower_limit" ]; then
    echo "Upper limit must be greater than lower limit."
    exit 1
fi

# Calculate the range
range=$((upper_limit - lower_limit + 1))

# Generate a random number within the specified range
random_number=$((RANDOM % range + lower_limit))

# Print the random number
echo $random_number
