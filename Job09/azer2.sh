# Modifie egalement si le prénom ou le nom est changé

while IFS=$',' read -r id prenom nom mdp role; do

    if [ "$id" != "Id" ]; then

        if id "$prenom" &>/dev/null; then

            sudo usermod -l "$prenom" -m -d "/home/$prenom" -c "$prenom $nom" "$prenom"

          if [ "$role" == "Admin" ]; then
            sudo usermod -aG sudo "$prenom"
          else
            sudo deluser "$prenom" sudo
	  fi

	else
            hashed_password=$(mkpasswd -m sha-512 "$mdp")
            sudo useradd -m "$prenom" -G users -c "$prenom $nom" -p "$hashed_password"
	  if [ "$role" == "Admin" ]; then
                sudo usermod -aG sudo "$prenom"
          fi
	fi
    fi

done < "/home/lucas/shell-exe/Job09/userlist.csv"
