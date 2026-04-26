#!/bin/bash

#Zadatak 2
#Napišite bash skriptu koja će primiti 1 argument: broj od 1 do 10.
#Skripta mora provjeriti je li argument unutar zadanog raspona, a ako nije, prekida s radom i ispisuje odgovarajuću poruku.
#Ako je argument unutar zadanog raspona, skripta izrađuje novu datoteku brojevi.txt u koju će pohraniti niz koji sadrži 
#sve brojeve od 1 do zadanog broja.

#!/bin/bash

broj="$1"
datoteka="brojevi.txt"
if [ $# -ne 1 ]; then
    echo "Potrebno je proslijediti točno 1 argument, broj između 1 i 10!"
    echo -e "Primjer:\n./zadatak2.sh 5"
    exit 1
fi

if [[ "$broj" -ge 1 && broj -le 10 ]]; then
    echo "Unos ispravan"

        > $datoteka #Ovo je bitno, sa ovim brišemo sve do sada i pripremamo dateoteku za stvaranje novog zapisa
        for (( i=1; i<=broj; i++ )); do #for petlja kojom upisujemo sve brojeve
            echo "$i" >> $datoteka       #zapamti operator ">>" dodaje, apenda u novi red, a ">" prepisuje
        done
    echo "Brojevi 1 - "$broj" zapisani u "$datoteka"."
else
    echo "Unos neispravan, rasapon 1. argumenta mora biti od 1 do 10"
    exit 2
fi
