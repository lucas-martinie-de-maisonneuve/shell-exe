while IFS=$', ' read -r id prenom nom mdp role; do
#   ignorer , et espace

  if [ "$id" != "Id" ]; then
#       different de 

    hashed_password=$(mkpasswd -m sha-512 "$mdp") && sudo useradd -m "$prenom" -G users -c "$prenom $nom" -p "$hashed_password"
#  						              créer /home     groupe   nom complet  	   MdP


    [ "$role" == "Admin" ] && sudo usermod -aG sudo "$prenom" || sudo deluser "$prenom" sudo &>/dev/null
#          si egal       alors           addGroup           sinon			    n'existe pas
  fi
done < "/home/lucas/shell-exe/Job09/userlist.csv"
