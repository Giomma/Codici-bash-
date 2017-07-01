#!/bin/bash 
#set -x
#Scrivere uno script bash denominato "list_biggest.sh" che elenchi, in ordine discendente 
#di dimensione, tutti i file regolari presenti in una certa directory passata come 
#argomento sulla linea di comando dello script, indicando per ciascun file il suo percorso 
#relativo alla directory passata come argomento e la sua dimensione in bytes.

array=($(ls -l $1 | grep '^-' | awk '{print $5 " " $9}'| sort -nr | awk '{print $2}'))
numero_slash=$(echo $1 | tr -dc /| wc -c)
directory_rel=$(echo $1 | tr / " " | awk -v i=$numero_slash '{print $i}')

printf "%-30s  %-30s  %-30s\n" "NAME" "DIM" "RELATIVE"

for k in ${array[@]}
do
	printf "%-30s  %-30s  %-30s \n" $k $(stat -c%s $1/$k)  "$directory_rel/$k"
done


