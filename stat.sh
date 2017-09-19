#!/bin/bash

bytef=0
blockf=0
bytet=0
blockt=0

files=$(ls $1 | tr '\n' ' ') 
for file in $files
do
if [ -d $file ]
then
byte_file=$(stat -f %z "$file")
bytet=$(($bytet+$byte_file))
block_file=$(stat -f %b "$file")
blockt=$(($blockt+$block_file))
continue
fi 

byte_file=$(stat -f %z "$file")
bytef=$(($bytef+$byte_file))
bytet=$(($bytet+$byte_file))
block_file=$(stat -f %b "$file")
blockf=$(($blockf+$block_file))
blockt=$(($blockt+$block_file))


done

echo I file della directory occupano "$bytef" byte

echo I file della directory occupano "$blockf" blocchi

echo Tutto il contenuto della directory occupa "$bytet" byte

echo Tutto il contenuto della directory occupa "$blockt" blocchi