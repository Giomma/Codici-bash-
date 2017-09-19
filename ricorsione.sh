#!/bin/bash

mkdir B


copy ()
{

for y in $(ls)
 do 
 #%type=$(stat -f %p "$x" | cut -c1)
  
  if [[ -d $y ]]
  then
  echo "$y"
  continue
  #cd "$x"
  #copy
  else
  echo "copio file $y"
 cp "$y" /Users/andreagatto/Desktop/sistemioperativi/B/"$y"
   fi
 done
 

 
for x in $(ls)
do
echo "$x"
if [[ -d $x ]]
then
 echo "è una directory"
   if [[ -s "$x" ]]
   then
   echo "$x"
     cd "$x"
     echo $(pwd)
     copy
     cd ..
     else 
  echo " la cartella è vuota"
   fi
else 
  echo "file già copiati" 
 fi
 done
 
 sleep 1000000
 }
 
 copy  
   

