#!/bin/bash

start=$(echo "ibase=16 ; obase=2 ; 13000" | bc)
end=$(echo "ibase=16 ; obase=2 ; 130FF" | bc)
flag="$start"


while true
do
byte1="1110$(echo $start | cut -c1-4)"
byte2="10$(echo $start | cut -c5-10)"
byte3="10$(echo $start | cut -c11-16)"
byte4="10$(echo $start | cut -c17)00000"

byte1hex=$(echo "obase=16; ibase=2; $byte1" | bc)
byte2hex=$(echo "obase=16; ibase=2; $byte2" | bc)
byte3hex=$(echo "obase=16; ibase=2; $byte3" | bc)
byte4hex=$(echo "obase=16; ibase=2; $byte4" | bc)
 echo "$start in UTF-8 è $byte1hex $byte2hex $byte3hex $byte4hex"

 startp=$(echo "obase=2; ibase=2; $start + 1" | bc)
 start="$startp"
 printf "\x"$byte1hex"\x"$byte2hex"\x"$byte3hex"\x"$byte4hex""
 
if [[ "$start" -eq "$end" ]]
then 
break
fi

done 
