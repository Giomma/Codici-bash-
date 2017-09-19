#!/bin/bash
echo "Cartella cercata $1"
echo $1
cd $(echo $1)
echo a
numero=$( ls -l | wc -l)
echo $numero
i=0
for x in $(ls -1 -i | tr ' ' '\n' | grep -v ^.*[[:alpha:]].*$ | tr '\n' ' ')
do
i=$(($i + $x))
done

echo b
permission=$(stat -f %p $1 | cut -c2-5)
echo c
echo $permission
string="$permission $numero $i"

echo $string




