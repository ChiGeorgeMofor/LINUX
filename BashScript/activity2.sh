#!/bin/bash
  
# An activity which prints a random word, allows user to specify number of random words...
    
# Function to get the word list file path
get_word_list() {   
    if [ -f "/usr/share/dict/words" ]; then
        echo "/usr/share/dict/words"
    elif [ -f "/usr/dict/words" ]; then
        echo "/usr/dict/words"
    else
        echo ""
    fi
}

# Get the word list file path
word_list=$(get_word_list)

# Check if the word list file was found
if [ -z "$word_list" ]; then
    echo "Word list file not found."
    exit 1
fi

# Check if the word list file is empty
if [ ! -s "$word_list" ]; then
    echo "The word list file is empty."
    exit 1
fi

# Check if shuf command is available
if ! command -v shuf &> /dev/null; then
    echo "shuf command not found. Please install it to proceed."
    exit 1
fi

# Get the number of words to generate
read -p "Enter the number of random words to generate: " num_words

# Check if the input is valid
if ! [[ "$num_words" =~ ^[0-9]+$ ]] || [ "$num_words" -eq 0 ]; then
    echo "Invalid input. Please enter a positive integer."
    exit 1
fi

# Generate and print the random words
random_words=$(shuf -n "$num_words" "$word_list")

# Check if the shuf command succeeded
if [ $? -ne 0 ]; then
    echo "Failed to generate random words."
    exit 1
fi

echo "Random words:"
echo "$random_words"

