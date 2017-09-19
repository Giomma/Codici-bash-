#!/bin/bash


echo Vediamo quanto tempo ci metti a scrivere sulla tastiera la frase che si trova tra le virgolette \(il tempo verrà computato dal momento in cui tocchi il primo tasto\):"Ma la volpe col suo balzo ha raggiunto il quieto Fido"
start=$(date -j -f "%a %d %b %Y %T %Z" "$(date)" "+%s")
read -t45 frase 
exit_status="$?"
end=$(date -j -f "%a %d %b %Y %T %Z" "$(date)" "+%s")

time=$(($end - $start))

if [[ "$exit_status" -eq 0 ]]
then

echo  "ci hai messo $time secondi"
else
echo Hai superato la soglia di 45 secondi! 
fi

