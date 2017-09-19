#!/bin/bash


while true
do


ping -q -c 1  "$1" >/dev/null  && echo "Risponde in data $(date)" >> risultato.txt || echo "Non risponde in data $(date)" >> risultato.txt &

done


