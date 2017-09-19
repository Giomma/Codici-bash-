#!/bin/bash


find "$1" | while read line
do
compare=$(find "$2" | grep $line)

if [[ -z "${compare// }" ]]
then 
echo Il file "$line" appare solo in $1
fi
done

find "$2" | while read linet
do
compare=$(find "$1" | grep $linet)

if [[ -z "${compare// }" ]]
then 
echo Il file "$linet" appare solo in $2
fi
done


