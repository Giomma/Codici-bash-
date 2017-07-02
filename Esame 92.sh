#!/bin/bash



while true 
do
read -n1 -t5 -s tasto
if [ "$tasto" == "c" ] ; then
       printf " %-30s  %-30s \n " "PID" "CPU%"
       printf " %-30s  %-30s \n " $(ps aux --sort pcpu | tail -n3 | awk '{ print $2"  "$3 }' | tac)
       printf \\n
elif [ "$tasto" == "q" ] ; then
       exit 0 

elif [ "$tasto" == "m" ] ; then
       printf " %-30s  %-30s \n " $(ps aux | awk '{print $2 "  " $4 }' | sort -k2r | head -n 4)
       printf \\n 

elif [ "$tasto" == "t" ] ; then
       printf " %-30s  %-30s \n " $(ps aux | awk '{print $2, $10}' | sort -k2r | head -n 4)
       printf \\n

elif [ "$?" -eq "1" ] ; then 
       printf " Ci sono $(ps -e | grep -v PID | wc -l) processi attivi in questo momento \\n "
fi
done
