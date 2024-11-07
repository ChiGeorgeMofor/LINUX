#!/bin/bash
# Basic until loop
 
# The until loop is faily similar to the while loop. The difference is that it will execute the commands 
# within it until the test becomes true.
 
counter=1
until [ $counter -gt 10 ]
do
	echo $counter
	((counter++))
done 

echo All done
