csv=/home/lucas/shell-exe/Job09/userlist.csv

if [ ! -f "$csv" ]; then
    echo "Le fichier CSV n'existe pas."
    exit 1
fi


while IFS=$',' read -r id prenom nom mdp role; do

    if [ "$role" == "Admin" ]; then

        sudo useradd -m -G sudo -p "$mdp" "$id"

    elif [ "$role" == "User" ]; then

        sudo useradd -m -G users -p "$mdp" "$id"

 else
        echo "Rôle inconnu pour l'utilisateur $id : $role"
    fi
done < /home/lucas/shell-exe/Job09/userlist.csv
