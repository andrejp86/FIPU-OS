#!/bin/bash

#Zadatak 1
#Napišite bash skriptu koja će primiti 2 argumenta:
#prvi argument je apsolutna putanja do direktorija
#drugi argument je datotečni nastavak (npr. .txt, .html, .sh, itd.)
#Skripta mora proći kroz sve datoteke u direktoriju i ispisati samo one datoteke koje imaju zadani nastavak. Ako ne postoji 
#nijedna datoteka s tim nastavkom, skripta mora ispisati poruku da nema takvih datoteka.
#U ispisu moraju biti uključene samo datoteke i to njihovi nazivi bez korijenskih direktorija (apsolutnih putanja) Ako korisnik 
#ne proslijedi točno 2 argumenta, prekinite rad skripte i ispišite poruku da je potrebno proslijediti točno 2 argumenta.

#!/bin/bash

putanja="$1"
ekstenzija="$2"

if [ $# -ne 2 ]; then
    echo "Potrebno je proslijediti točno 2 argumenta!"
    echo -e "   Argument 1: apsolutna putanja\n   Argument 2: nastavak datoteke (.txt, .html, .sh, itd.)"
    echo  "Primjer:"
    echo './zadatak1.sh "$(pwd)" .txt' #Oprez, koristi jednostruke navodnike '' ako ne želiš da se neka naredba izvrši u ispisu!
    exit 1
fi

postoji=false #definiraj pomoćnu varijablu kao triger kada se pronđe datoteka

for datoteka in "$putanja"/*"$ekstenzija"; do
    if [ -f "$datoteka" ]; then
        basename "$datoteka"
        postoji=true
    fi
done

if [ "$postoji" = false ]; then
    echo "Nema datoteka s nastavkom $ekstenzija"
fi

#Oprez, radi razmaka u putanji, koristi sistemsku naredbu "pwd" tako je nasjsgurnje da će sve raditi
#primjer upita --> (moraš se nalaziti u mapi skripte) ./zadatak1 "$(pwd)" .txt