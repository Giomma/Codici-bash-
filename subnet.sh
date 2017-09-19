#!/bin/bash



ip=$(echo "$2" | tr '.' '\n' | while read cifra
do
cifra=$(echo "obase=2;ibase=10; $cifra" | bc)

numero_cifre=$(($(echo "$cifra" | wc -c)-1))

if [[ $numero_cifre -lt 8 ]]
then 
  
   if [[ $numero_cifre -eq 1 ]]
   then
   cifra=0000000"$cifra"
   fi
   
   if [[ $numero_cifre -eq 2 ]]
   then
   cifra=000000"$cifra"
   fi
   
   if [[ $numero_cifre -eq 3 ]]
   then
   cifra=00000"$cifra"
   fi
   
   if [[ $numero_cifre -eq 4 ]]
   then
   cifra=0000"$cifra"
   fi
   
   if [[ $numero_cifre -eq 5 ]]
   then
   cifra=000"$cifra"
   fi
   
   if [[ $numero_cifre -eq 6 ]]
   then
   cifra=00"$cifra"
   fi
   
   if [[ $numero_cifre -eq 7 ]]
   then
   cifra=0"$cifra"
   fi
   
fi
echo $cifra
done)


ip2=$(echo "$3" | tr '.' '\n' | while read cifra
do
cifra=$(echo "obase=2;ibase=10; $cifra" | bc)

numero_cifre=$(($(echo "$cifra" | wc -c)-1))

if [[ $numero_cifre -lt 8 ]]
then 
  
   if [[ $numero_cifre -eq 1 ]]
   then
   cifra=0000000"$cifra"
   fi
   
   if [[ $numero_cifre -eq 2 ]]
   then
   cifra=000000"$cifra"
   fi
   
   if [[ $numero_cifre -eq 3 ]]
   then
   cifra=00000"$cifra"
   fi
   
   if [[ $numero_cifre -eq 4 ]]
   then
   cifra=0000"$cifra"
   fi
   
   if [[ $numero_cifre -eq 5 ]]
   then
   cifra=000"$cifra"
   fi
   
   if [[ $numero_cifre -eq 6 ]]
   then
   cifra=00"$cifra"
   fi
   
   if [[ $numero_cifre -eq 7 ]]
   then
   cifra=0"$cifra"
   fi
   
fi
echo $cifra
done)


subnet=$(echo "$1" | tr '.' '\n' | while read cifra
do
cifra=$(echo "obase=2;ibase=10; $cifra" | bc)

numero_cifre=$(($(echo "$cifra" | wc -c)-1))

if [[ $numero_cifre -lt 8 ]]
then 
  
   if [[ $numero_cifre -eq 1 ]]
   then
   cifra=0000000"$cifra"
   fi
   
   if [[ $numero_cifre -eq 2 ]]
   then
   cifra=000000"$cifra"
   fi
   
   if [[ $numero_cifre -eq 3 ]]
   then
   cifra=00000"$cifra"
   fi
   
   if [[ $numero_cifre -eq 4 ]]
   then
   cifra=0000"$cifra"
   fi
   
   if [[ $numero_cifre -eq 5 ]]
   then
   cifra=000"$cifra"
   fi
   
   if [[ $numero_cifre -eq 6 ]]
   then
   cifra=00"$cifra"
   fi
   
   if [[ $numero_cifre -eq 7 ]]
   then
   cifra=0"$cifra"
   fi
   
fi
echo $cifra
done)

arrayip=($ip)
arrayip2=($ip2)
i=0

for sub in $subnet
do
echo $sub
echo $i



 if [ "$sub" == "00000000" ]
  then 
   echo Appartengono alla stessa subnet Mask
   break
   fi

if [ "$sub" == "11111111" ]
then 
   if [ "${arrayip[$i]}" == "${arrayip2[$i]}" ]
   then
    i=$(( $i+1 ))
   continue
   else
   echo Non appartengono alla stesa subnet
   break
   fi
 else
 num=$(echo "$sub" | grep -o 1 | wc -l)
 echo $sub
 echo $num
 tip1=$(echo "${arrayip[$i]}" | cut -c1-${num} )
 tip2=$(echo "${arrayip2[$i]}" | cut -c1-${num} )
 num=0
    if [ "$tip1" == "$tip2" ]
   then
    i=$(( $i+1 ))
   continue
   else
   echo Non appartengono alla stesa subnet
   break
   fi
 fi
 
 i=$(( $i+1 ))
 done
 
 
  

















