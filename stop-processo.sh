#!/bin/bash

. idle_launch.sh &

while true
do
cpu=$(top -l 1 | grep -o CPU\ usage:\ [[:digit:]]* | tr ' ' '\n' | grep -v ^.*[[:alpha:]].*$)
echo $cpu
status=$(jobs -l | grep $!| awk '{printf "%s\n",$3}')
echo $status
if [ "$status" == "Suspended" ]
then
echo a 
    if [[ $cpu -lt $1 ]]
    then 
    echo "Riprendo il processo"
    kill -SIGCONT $!
    continue
    else
    continue
    fi
fi

if [[ $cpu -gt $2 ]]
then 
echo "Stoppo il processo"
kill -SIGSTOP $!
fi
done
    


