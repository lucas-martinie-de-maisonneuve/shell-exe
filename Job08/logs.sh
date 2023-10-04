user=$lucas

connexion=$(last | grep "$user" | wc -l)
date=$(date +"%d-%m-%Y-%H:%M")

sortie="~/shell-exe/Job08/number_connection-$date"

echo "$connexion" > "$sortie"


echo "$user s'est connecté $connexion fois en date du $date"


tar -czf "$sortie.tar" $sortie
rm $sortie
