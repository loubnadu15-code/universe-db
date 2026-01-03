#!/bin/bash
PSQL="psql --username=freecodecamp --dbname=number_guess -t --no-align -c"
echo "Enter your username:"
read USERNAME
# Échapper les apostrophes dans le nom d'utilisateur
ESCAPED_USERNAME=$(echo "$USERNAME" | sed "s/'/''/g")
# Vérifier si l'utilisateur existe déjà
USER_ID=$($PSQL "SELECT user_id FROM users WHERE username='$ESCAPED_USERNAME'")
if [[ -z $USER_ID ]]
then
    # Nouvel utilisateur
    echo "Welcome, $USERNAME! It looks like this is your first time here."
    INSERT_RESULT=$($PSQL "INSERT INTO users(username) VALUES('$ESCAPED_USERNAME')")
    USER_ID=$($PSQL "SELECT user_id FROM users WHERE username='$ESCAPED_USERNAME'")
else
    # Utilisateur existant - récupérer ses statistiques
    GAMES_PLAYED=$($PSQL "SELECT COUNT(game_id) FROM games WHERE user_id=$USER_ID")
    BEST_GAME=$($PSQL "SELECT MIN(guesses) FROM games WHERE user_id=$USER_ID AND guesses > 0")
    
    if [[ -z $BEST_GAME ]]
    then
        BEST_GAME=0
    fi
    
    echo "Welcome back, $USERNAME! You have played $GAMES_PLAYED games, and your best game took $BEST_GAME guesses."
fi
# Générer un nombre aléatoire entre 1 et 1000
SECRET_NUMBER=$(( RANDOM % 1000 + 1 ))
GUESS_COUNT=0
echo "Guess the secret number between 1 and 1000:"
while true
do
    read GUESS
    ((GUESS_COUNT++))
    
    # Vérifier si c'est un entier
    if [[ ! $GUESS =~ ^-?[0-9]+$ ]]
    then
        echo "That is not an integer, guess again:"
        ((GUESS_COUNT--)) # Ne pas compter cette tentative invalide
        continue
    fi
    
    # Comparer la devinette avec le nombre secret
    if [[ $GUESS -eq $SECRET_NUMBER ]]
    then
        echo "You guessed it in $GUESS_COUNT tries. The secret number was $SECRET_NUMBER. Nice job!"
        
        # Enregistrer la partie dans la base de données
        INSERT_GAME=$($PSQL "INSERT INTO games(user_id, guesses, secret_number) VALUES($USER_ID, $GUESS_COUNT, $SECRET_NUMBER)")
        break
    elif [[ $GUESS -lt $SECRET_NUMBER ]]
    then
        echo "It's higher than that, guess again:"
    else
        echo "It's lower than that, guess again:"
    fi
done

