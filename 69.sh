#!/bin/bash 

if [ ! -e $1 ] ; then
	echo Lo script non esiste 
	exit 1
elif [ ! -x $1 ] ; then
	echo Lo script non è eseguibile. Cambiare i permessi?
	echo \"s\" per cambiare i permessi , \"n\" per lasciarli cosi
	read -n1 -s tasto
	if [ "$tasto" == "s" ] ; then
		chmod a-x $1
		permessi=$(stat -c "%a %n" $1 | awk '{print $1}')
		chmod $(( $permessi + 111)) $1
		echo permessi cambiati
	elif [ "$tasto" == "n" ] ; then
		echo Permessi non cambiati 
		exit 1
	else 
		exit 1
	fi
fi



nohup $1 & # nohup lascia il terminale libero, se nello script passato ci sono comandi come echo te li stampa a terminale anche se il processo è in background 
PID=$!

while true
do
echo $(ps -aef | awk '{print $3}' | grep $PID | wc -l) processi eseguiti da $PID   # Mostra tutti i processi, anche quelli dello script, $3 è il parent id .
echo  $(pmap -x $PID | tail -n1 | awk '{print $3}' ) kb di  memoria reale utilizzata # Sicuramente sbagliato,non ho capito bene
sleep 1
done

# il terzo punto non so proprio cosa vuole
