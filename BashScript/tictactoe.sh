#!/bin/bash
   
# Initialize the board
board=('_' '_' '_' '_' '_' '_' '_' '_' '_')

# Function to display the board
display_board() {
    echo " ${board[0]} | ${board[1]} | ${board[2]} "
    echo "-----------"
    echo " ${board[3]} | ${board[4]} | ${board[5]} "
    echo "-----------"
    echo " ${board[6]} | ${board[7]} | ${board[8]} "
}

# Function to check for a win
check_win() {
    local player=$1
    local win_patterns=("012" "345" "678" "036" "147" "258" "048" "246")

    for pattern in "${win_patterns[@]}"; do
        if [[ ${board[${pattern:0:1}]} == $player && ${board[${pattern:1:1}]} == $player && ${board[${pattern:2:2}]} == $player ]]; then
            return 0
        fi
    done
    return 1
}

# Function to check if the board is full
check_draw() {
    for cell in "${board[@]}"; do
        if [[ $cell == '_' ]]; then
            return 1
        fi
    done
    return 0
}

# Function to make a move
make_move() {
    local player=$1
    local position=$2
    board[$position]=$player
}

# Function to get the computer's move
computer_move() {
    local empty_positions=()
    for i in "${!board[@]}"; do
        if [[ ${board[$i]} == '_' ]]; then
            empty_positions+=($i)
        fi
    done
    local move=${empty_positions[RANDOM % ${#empty_positions[@]}]}
    make_move 'O' $move
}

# Function to check if a move is valid
is_valid_move() {
    local position=$1
    [[ ${board[$position]} == '_' ]]
}

# Main game loop
while true; do
    clear
    display_board

    # Player move
    read -p "Enter your move (0-8): " move
    if ! [[ $move =~ ^[0-8]$ ]] || ! is_valid_move $move; then
        echo "Invalid move. Try again."
        continue
    fi
    make_move 'X' $move

    if check_win 'X'; then
        clear
        display_board
        echo "Congratulations! You won!"
        exit 0
    fi

    if check_draw; then
        clear
        display_board
        echo "It's a draw!"
        exit 0
    fi

    # Computer move
    computer_move

    if check_win 'O'; then
        clear
        display_board
        echo "Sorry! The computer won."
        exit 0
    fi

    if check_draw; then
        clear
        display_board
        echo "It's a draw!"
        exit 0
    fi
done
