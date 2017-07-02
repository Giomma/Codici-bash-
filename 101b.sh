#!/bin/bash

#Scrivere uno script bash che prenda come argomenti sulla linea di comando un numero 
#intero T>0 e i percorsi relativi o assoluti di un numero arbitrario di directory 
#e svolga la seguente operazione:
#dopo T secondi dall'istante del lancio elenchi tutti i file contenuti nelle directory
#passate come argomento che sono stati modificati, aggiunti o rimossi rispetto 
#all'istante del lancio.


T=$1
a=$(date +"%H:%M:%S")
dateEp=$(date +%s)
printf "Orario avvio script $a\n"
sleep $T
echo Script started!

dir_arr=($(for directory in "$@" ; do echo $directory ; done | grep -v $T))
echo ${dir_arr[*]}   

#Stampo tutti gli argomenti passati allo script tranne il time. 

read -n 1 -s -p "Press any key after file changes:  "

for dir in "${dir_arr[@]}"
do
  for file in $dir/*
  do
    if [[ -f $file ]]
    then
        time1=$(stat --format %W $file 2>/dev/null)
        time2=$(stat --format %Y $file 2>/dev/null)
        time3=$(stat --format %Z $file 2>/dev/null)
        time4=$(stat --format %X $file 2>/dev/null)
        for time in time1 time2 time3 time4
        do
          if (( $time > $dateEp ))
          then echo $file
          fi
        done
     fi
  done
done



