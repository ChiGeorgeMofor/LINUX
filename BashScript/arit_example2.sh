#!/bin/bash
# Basic arithmetic using double parenthesis
 
a=$(( 4 + 3 ))
echo $a 
    
a=$((3+5)) 
echo $a
 
b=$(( a + 3 ))
echo $b

(( b++ ))
echo $b

(( b += 3 ))
echo $b

a=$(( 4 * 5 ))
echo $a
