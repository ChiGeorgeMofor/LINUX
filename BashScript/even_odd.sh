#!/bin/bash

# Loop through numbers 1 to 10
for (( num = 1; num <= 10; num++ ))
do
	# Check if the number is even or odd
	if (( num % 2 == 0 )); then
		echo "$num is even"
	else
		echo "$num is odd"
	fi
done
