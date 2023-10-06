	while IFS=$', ' read -r id prenom nom mdp role; do
   # ignorer , et espace

    if [ "$id" != "Id" ]; then
       # different de 

        if id "$prenom" &>/dev/null; then
            pass_crypte=$(mkpasswd -m sha-512 "$mdp")
	    sudo usermod -m -d "/home/$prenom" -c "$prenom $nom" -p "$pass_crypte" "$prenom"

            if [ "$role" == "Admin" ]; then
                sudo usermod -aG sudo "$prenom"
            else
                sudo deluser "$prenom" sudo &>/dev/null
            fi
        else
            pass_crypte=$(mkpasswd -m sha-512 "$mdp")
            sudo useradd -m "$prenom" -G users -c "$prenom $nom" -p "$pass_crypte"

            if [ "$role" == "Admin" ]; then
                sudo usermod -aG sudo "$prenom"
            fi
        fi
    fi
done < "/home/lucas/shell-exe/Job09/userlist.csv"
