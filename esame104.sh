#!/bin/bash 



w=$(( `tput cols ` / 2 ));  

while true
do
printf "%${w}s \n"  "|";
read -n1 -t0.01 -s variabile ;
if [ "$variabile" == "d" ]
then
w=$((w +1)) 
elif [ "$variabile" == "s" ]
then
w=$((w -1))
fi
done
