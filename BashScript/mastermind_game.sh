#!/bin/bash
 
# Function to generate a random code of given length from a given character set
generate_code(){
	local length=$1
	local charset=$2
	local code=""
	local charset_length=${#charset}

	
	for (( i=0; i<length; i++)); do
		local index=$(( RANDOM % charset_length ))
		code+="${charset:$index:1}"
	done

	echo "$code"
}

# Function to give feedback on the guess
give_feedback() {
	local code=$1
	local guess=$2
	local feedback=""

	for (( i=0; i<${#code}; i++)); do
		if [[ ${code:$i:1} == ${guess:$i:1} ]]; then
			feedback+="✓"
		elif [[ $code =~ ${guess:$i:1} ]]; then
			feedback+="~"
		else 
			feedback+="-"
		fi
	done

	echo "$feedback"
}

# Configuration
CODE_LENGTH=4
CHARSET="ABCDEFGHIJKLMNOPQRSTUVWXYZ"
MAX_ATTEMPTS=10

# Generate a random code
code=$(generate_code $CODE_LENGTH "$CHARSET")
echo "Welcome to Mastermind!"
echo "Try to guess the $CODE_LENGTH-letter code using letters from $CHARSET."
echo "You have $MAX_ATTEMPTS attempts."

# Game Loop
for (( attempt=1; attempt<=MAX_ATTEMPTS; attempt++ )); do
	read -p "Attempt $attempt: " guess

	# Check if the guess length is correct
	if [[ ${#guess} -ne $CODE_LENGTH ]]; then
		echo "Invalid guess length. The code is $CODE_LENGTH letters long."
		continue
	fi

	# Check if the guess is correct
	if [[ $guess == $code ]]; then
		echo "Congratulations! You've guessed the code correctly: $code"
		exit 0
	else
		feedback=$(give_feedback "$code" "$guess")
		echo "Feedback: $feedback"
	fi
done

# If max attempts are exhausted
echo "Sorry! You've used all your attempts. The correct code was: $code:
