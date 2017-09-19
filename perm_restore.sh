#!/bin/bash

cat file_permessi.txt | awk '{printf "%s\t%s\n", $3,$6}' | while read old
do
nome=$(echo "$old"|awk '{printf "%s",$1}')
echo "$nome"
perm=$(stat -x "$nome"| egrep -o '\([[:digit:]]{4}' | cut -c2-5)
oldperm=$(echo "$old" | awk '{printf "%s",$2}')

if [[ "$perm" -ne "$oldperm" ]]
then 
chmod "$oldperm" "$nome"
echo Il file "$nome" ha modificato i suoi permessi
fi

done