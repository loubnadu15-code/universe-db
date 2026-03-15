#! /bin/bash

# Variable contenant la commande psql avec les paramètres :
# --username=freecodecamp : utilisateur PostgreSQL
# --dbname=salon : base de données utilisée
# --tuples-only : supprime les en-têtes et formatage de psql
# -c : permet d'exécuter directement une commande SQL
PSQL="psql --username=freecodecamp --dbname=salon --tuples-only -c"

# Affiche le titre de l'application dans le terminal
echo -e "\n~~~~~ MY SALON ~~~~~\n"

# Fonction principale qui affiche le menu des services
MAIN_MENU() {
  # Message d'accueil
  echo "Welcome to My Salon, how can I help you?"

  # Récupère la liste des services depuis la base de données
  # SELECT service_id, name FROM services : récupère l'id et le nom du service
  # ORDER BY service_id : trie les services par id
  SERVICES=$($PSQL "SELECT service_id, name FROM services ORDER BY service_id")

  # Parcourt chaque ligne du résultat SQL
  # read SERVICE_ID BAR SERVICE_NAME :
  # BAR correspond au séparateur "|" utilisé par psql
  echo "$SERVICES" | while read SERVICE_ID BAR SERVICE_NAME
  do
    # Affiche chaque service sous forme de menu
    echo "$SERVICE_ID) $SERVICE_NAME"
  done

  # Attend que l'utilisateur choisisse un service (saisie clavier)
  read SERVICE_ID_SELECTED

  # Vérifie si le service choisi existe dans la base
  SERVICE_EXISTS=$($PSQL "SELECT name FROM services WHERE service_id=$SERVICE_ID_SELECTED")

  # Si aucun résultat n'est retourné, le service n'existe pas
  if [[ -z $SERVICE_EXISTS ]]
  then
    # Message d'erreur
    echo -e "\nI could not find that service. What would you like today?"
    
    # Relance le menu principal
    MAIN_MENU
  else
    # Si le service existe, on passe à la prise de rendez-vous
    APPOINTMENT
  fi
}

# Fonction qui gère la création d'un rendez-vous
APPOINTMENT() {

  # Demande le numéro de téléphone du client
  echo -e "\nWhat's your phone number?"
  read CUSTOMER_PHONE

  # Recherche si le client existe déjà dans la base grâce au téléphone
  CUSTOMER_NAME=$($PSQL "SELECT name FROM customers WHERE phone='$CUSTOMER_PHONE'")

  # Si le client n'existe pas
  if [[ -z $CUSTOMER_NAME ]]
  then
    # On demande son nom
    echo -e "\nI don't have a record for that phone number, what's your name?"
    read CUSTOMER_NAME

    # On ajoute le nouveau client dans la table customers
    $PSQL "INSERT INTO customers(phone, name) VALUES('$CUSTOMER_PHONE', '$CUSTOMER_NAME')"
  fi

  # Récupère l'id du client à partir de son téléphone
  CUSTOMER_ID=$($PSQL "SELECT customer_id FROM customers WHERE phone='$CUSTOMER_PHONE'")

  # Récupère le nom du service choisi
  SERVICE_NAME=$($PSQL "SELECT name FROM services WHERE service_id=$SERVICE_ID_SELECTED")

  # Demande à l'utilisateur l'heure du rendez-vous
  echo -e "\nWhat time would you like your $SERVICE_NAME, $CUSTOMER_NAME?"
  read SERVICE_TIME

  # Insère le rendez-vous dans la table appointments
  # customer_id : id du client
  # service_id : service choisi
  # time : heure du rendez-vous
  $PSQL "INSERT INTO appointments(customer_id, service_id, time)
  VALUES($CUSTOMER_ID, $SERVICE_ID_SELECTED, '$SERVICE_TIME')"

  # Message de confirmation du rendez-vous
  echo -e "\nI have put you down for a $SERVICE_NAME at $SERVICE_TIME, $CUSTOMER_NAME."
}

# Lance le programme en appelant la fonction du menu principal
MAIN_MENU
