#!/bin/bash 


#Scrivere uno script bash che individui il processo che ha il maggior numero di connessioni
#TCP attive e si stampino i nodi con cui tale processo ha aperto connessioni.
#Non si tenga conto delle limitazioni eventualmente imposte allo script a causa della 
#mancanza dei privilegi di amministrazione. Si scriva invece lo script in modo che esso 
#funzioni senza limitazioni se utilizzato da un amministratore della macchina su cui è
#eseguito.
#Al termine della stesura dello script (anche nel caso non si sia riusciti ad ottenere
#il risultato richiesto):
#1) si trasferisca la cartella dell'esercizio nella propria home Linux (come già richiesto
#dalle istruzioni preliminari in questa stessa pagina);
#2) sulla macchina Linux (hplinux2), si firmi lo script (hash sha256) usando una propria 
#chiave privata (eventualmente creata per l'occasione).  Si denomini signature il file 
#contenente la firma e si lasci nella cartella lo script, la firma, la propria chiave 
#pubblica e il file "leggimi.txt".
#3) si applichi alla cartella così composta la linea di comando sopra indicata.


PID=$(lsof -iTCP | awk '{print $2}' | grep -v ^"PID" | uniq -c | head -n1 | awk '{print $2}')
if [ -z "$PID" ] ; then 
printf "Non ci sono connessioni TCP attive al momento\n"
exit 1 
fi
printf "Il processo con il maggior numero di connessioni TCP attive è quello con PID $PID\n"
printf "Il processo $PID ha aperto connessioni tramite i seguenti nodi :\n"
for i in  $(lsof -p $PID | awk '{print $8}' | grep ^[[:digit:]] | sort -n | uniq ) 
do
echo $i
done



