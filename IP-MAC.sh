#!/bin/bash


#printa le associazioni IP- INDIRIZZO MAC
arp -an | awk '{printf "%s\t%s\n", $2, $4}' | tr '(',')' ' ' | while read string
do 
echo $string
sleep "$1"
#da finire
done
