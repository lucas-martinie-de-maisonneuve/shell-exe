if [ "$2" = "x" ]; then 
        echo Resultat= $(($1*$3))

else
        echo Resultat= $(($1 $2 $3))
fi
