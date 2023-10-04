if [ "$2" = "+" ]; then 
echo "Resultat= $(( $1 + $3 ))"

elif [ "$2" = "-" ]; then 
echo "Resultat= $(( $1 - $3 ))"

elif [ "$2" = "x" ]; then 
echo "Resultat= $(($1*$3))"

elif [ "$2" = "/" ]; then 
echo "Resultat= $(( $1 / $3 ))"

else echo "utiliser les opérateurs +, -, x, /"

fi
