while IFS=$',' read -r id prenom nom mdp role; do

  if [ "$id" != "Id" ]; then

	hashed_password=$(mkpasswd -m sha-512 "$mdp")
        sudo useradd -m "$prenom" -G users -c "$prenom $nom" -p "$hashed_password"

    if [ "$role" == "Admin" ]; then


	sudo usermod -aG sudo "$prenom"
    else

	sudo deluser "$prenom" sudo &>/dev/null
    fi
  fi

done < "/home/lucas/shell-exe/Job09/userlist.csv"

