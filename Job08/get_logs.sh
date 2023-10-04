user=$"lucas"
connexion=$(last | grep "$user" | wc -l)
date=$(date +"%d-%m-%Y-%H:%M")
name="number_connection-$date"


echo "$user s'est connecté $connexion fois en date du $date" > ~/shell-exe/Job08/$name

tar -cvf ~/shell-exe/Job08/Backup/$name.tar $name
rm $name


echo "$user s'est connecté $connexion fois en date du $date"

