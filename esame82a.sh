#!/bin/bash
array=($(ps -e | cut -c1-5 | grep -v PID))
#echo ${array[*]}
j=0
for i in "${array[@]}"
do
dirarr[$j]=$(ls -l /proc/$i/exe 2>/dev/null | rev | cut -d ' ' -f1 | rev | xargs -I % dirname %) 
let "j += 1" 
  #sudo prima di ls per tutti i path
  #salvo i path, con il dirname, in un array in modo da poter fare il prossimo controllo
done
#echo ${dirarr[*]}
count=0
for k in "${dirarr[@]}"
do 
 if (( ${#k} \> $count ));   
 then count=${#k}
 fi;
done
for k in "${dirarr[@]}"
do 
 if (( ${#k} == $count ));    
 then echo $k
 fi;
done
  #faccio il confronto tra i path dell'array per trovare quello più lungo
  #e poi scorro tutto l'array, i path più lunghi vengono stampati
