#!/bin/bash

# Generate a random number between 0 and 1000
target=$((RANDOM % 1001))

# Initialize the number of tries to 0
tries=0

while true; do
  # Ask the user to enter a number
  read -p "Enter a number between 0 and 1000: " guess

  # Verify the user input is within the range
  if [[ $guess -lt 0 || $guess -gt 1000 ]]; then
    echo "Invalid input! Please enter a number between 0 and 1000."
    continue
  fi

  # Increment the number of tries
  ((tries++))

  # Compare the user's guess with the target
  if [[ $guess -gt $target ]]; then
    echo "Your guess was higher."
  elif [[ $guess -lt $target ]]; then
    echo "Your guess was lower."
  else
    echo "Congratulations! You guessed the target number in $tries tries."
    exit 0
  fi
done