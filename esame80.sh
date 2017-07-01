#!/bin/bash
file=$1
printf "FILE CONTENT\n\n"
cat $file                       #stampa testo in output

#cat /dev/null > testo_in_numeri.txt crea file/ pulito

printf "\nCounting..\n\n"
read -a WORDS -d "" < $file #-a mi salva le parole in un array e -d mi definisce il separatore  

for word in "${WORDS[@]}"
do
        echo ${#word} #mi stampa il numero di caratteri di ogni parola 
done
 
	
