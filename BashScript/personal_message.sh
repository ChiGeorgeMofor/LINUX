#!/bin/bash
  
# Function to display a message with user input, command line arguments, and system variables
generate_message() {
    # Ask for user input
    read -p 'Enter your name: ' name
    read -p 'Enter your favorite color: ' color
    read -p 'Enter your location: ' location

    # Get command line arguments 
    arg1=${1:-"No argument provided"}
    arg2=${2:-"No second argument provided"}

    # Get system variables
    current_date=$(date +"%Y-%m-%d")
    home_directory=$HOME

    # Generate and display the message
    echo "Hello, $name!"
    echo "We have some information for you:"
    echo "Favorite Color: $color"
    echo "Location: $location"
    echo "Command Line Arguments: Argument 1 is '$arg1', Argument 2 is '$arg2'"
    echo "Current Date: $current_date"
    echo "Your Home Directory: $home_directory"
}

# Call the function
generate_message
