#!/bin/bash
PSQL="psql --username=freecodecamp --dbname=users -t --no-align -c"
PLAY_THE_GAME() {
  read NUMBER
  if [[ ! $NUMBER =~ ^-?[0-9]+$ ]]; then
  echo "That is not an integer, guess again:"
  PLAY_THE_GAME
  else
    if [[ $RANDOM_NUMBER -eq $NUMBER ]]; then
    ADD_COUNTER
    echo "You guessed it in $NUMBER_OF_GUESSES tries. The secret number was $RANDOM_NUMBER. Nice job!"
    # check if it's best game
    CHECK_BEST_GAME=$($PSQL "SELECT COALESCE(MAX(best_game), 0) FROM user_name")
      if [[ $CHECK_BEST_GAME -lt $NUMBER_OF_GUESSES ]]; then
      UPDATE_SCORES=$($PSQL "UPDATE user_name SET amount_of_games = amount_of_games + 1, best_game = $NUMBER_OF_GUESSES WHERE name = '$VISITOR'")
      exit 0
      else
      # updating just number of games
      UPDATE_SCORES=$($PSQL "UPDATE user_name SET amount_of_games = amount_of_games + 1 WHERE name = '$VISITOR'")
      exit 0
      fi
    elif [[ $NUMBER -gt $RANDOM_NUMBER ]]; then
    ADD_COUNTER
    echo "It's lower than that, guess again:"
    PLAY_THE_GAME
    else
    ADD_COUNTER
    echo "It's higher than that, guess again:"
    PLAY_THE_GAME
    fi
  fi
}
ADD_COUNTER() {
((NUMBER_OF_GUESSES++))
}
echo "Enter your username:"
read USERNAME
RANDOM_NUMBER=$(shuf -i 1-1000 -n1)
# Checking if the user visited before
VISITOR=$($PSQL "SELECT name FROM user_name WHERE name ILIKE '$USERNAME'")
# If not
if [[ -z $VISITOR ]]; then
echo "Welcome, $USERNAME! It looks like this is your first time here."
INSERT_USER=$($PSQL "INSERT INTO user_name(name) VALUES('$USERNAME')")
VISITOR=$($PSQL "SELECT name FROM user_name WHERE name = '$USERNAME'")
echo "Guess the secret number between 1 and 1000:"
PLAY_THE_GAME
else
GAMES_PLAYED=$($PSQL "SELECT amount_of_games FROM user_name WHERE name = '$VISITOR'")
BEST_GAME=$($PSQL "SELECT best_game FROM user_name WHERE name = '$VISITOR'")
echo "Welcome back, $USERNAME! You have played $GAMES_PLAYED games, and your best game took $BEST_GAME guesses."
echo "Guess the secret number between 1 and 1000:"
fi
PLAY_THE_GAME
