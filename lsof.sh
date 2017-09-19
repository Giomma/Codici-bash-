#!/bin/bash 

dimensionmax=0
pid=0
i=0
processi=$(ps -aef | cut -c8-11 | grep -v ^.*[[:alpha:]].*$ ) 

for x in $processi
do
echo $i
echo $x
string=$(lsof -p $x | awk '{printf "%s\n",$7}' |tr 't' '0' |grep -v ^.*[[:alpha:]].*$ | tr '\n' ' ' | tr ' ' '+')0
echo $string
num=$(echo $string | bc)

if [[ $num -gt $dimensionmax ]]
then  
dimensionmax="$num"
pid=$x
fi

i=$(( $i+1 ))
printf "\n"
done

echo "$dimensionmax"B relativa al processo "$pid"

      