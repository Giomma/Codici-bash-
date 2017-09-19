#!/bin/bash
echo $1
i=0
while read -a STRING
do
    echo ${STRING[@]}
    for (( x=0; x<=${#STRING[@]}; x++ ))
    do
    
    echo ${#STRING["$x"]}
    done
    
done
        #echo ${#word} #mi stampa il numero di caratteri di ogni parola 



