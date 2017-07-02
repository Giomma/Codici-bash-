#!/bin/bash 

#Se si eseguono contemporaneamente quattro processi che svolgono calcoli della stessa natura, 
#normalmente lo scheduler dei processi assegna approssimativamente lo stesso tempo di 
#esecuzione a ciascuno di essi.

#Scrivere uno script bash che calcoli il metodo per lanciare quattro script bash ottenendo
#che a uno di essi lo scheduler dei processi dedichi una percentuale del tempo globale di
#esecuzione dei processi approssimativamente pari alla somma di quelle assegnate agli altri tre.



./1.sh &
PID1=$!
./2.sh &
PID2=$!
./3.sh &
PID3=$!
./4.sh &
PID4=$!

#MA PERCHE CAZZO NON LI MANDA IN BACKGROUND

sleep 5 # giusto per far consumare un po di cpu ai processi
while true
do

CPU1=$(echo "scale=4; $(ps -p $PID1 o %C | grep [[:digit:]]) / 100" | bc) # percentuale cpu divisa per cento
CPU2=$(echo "scale=4; $(ps -p $PID2 o %C | grep [[:digit:]]) / 100" | bc)
CPU3=$(echo "scale=4; $(ps -p $PID3 o %C | grep [[:digit:]]) / 100" | bc)



CPUSUM=$(echo $CPU1 + $CPU2 + $CPU3 | bc)

niceness=$(echo " 20 - $CPUSUM*20 "| bc)
nicenessINT=$(echo $niceness | cut -c1-2) #arrotondo o non la prende(valido solo per due cifre,se ho qualcosa come 6,7676 non lo prende perchè taglierebbe 6,7
sudo renice -n "-$nicenessINT" -p $PID4 #sudo perchè per una maggiore priorità ci vuole,quindi probabilmente l esercizio non si fa cosi
sleep 5
done
















