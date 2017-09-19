#!/bin/bash

echo hai passato la cartella "$1"

array=($(cd "$1" | ls | tr '\n' ' '))

for x in ${array[@]}
do
perm=$(stat -x "$x"| egrep -o '\([[:digit:]]{4}' | cut -c2-5)

echo Il file "$x" ha permessi "$perm" >> file_permessi.txt
done