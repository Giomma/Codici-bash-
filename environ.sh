#!/bin/bash


 if [ "$(uname)" == Linux ]
 then
  echo you\'re on Linux
  greater=0
pid_greater=0

pids=$(ps -aef | awk '{printf "%s\n", $2}' | grep -v  ^.*[[:alpha:]].*$ | tr '\n' ' ')
for pid in $pids
 do
 string=$(cat /proc/"$pid"/environ)
 n_var=$(echo $string  | grep -o [[:upper:]]* | wc -l)
 
 if [[ $n_var -gt $greater ]]
then
greater=$n_var
pid_greater=$pid
fi
 done
 
 echo $(cat /proc/"$pid_greater"/environ)
  
  
  
 else
 echo you\'re on MacOS
greater=0
pid_greater=0
pids=$(ps -aef | awk '{printf "%s\n", $2}' | grep -v  ^.*[[:alpha:]].*$ | tr '\n' ' ')
 
for pid in $pids
 do
 n_var=$(ps -p $pid -wwwE | tr ' ' '\n' | grep -o ^.*[[:alpha:]]*\=.*$ | wc -l)


if [[ $n_var -gt $greater ]]
then
greater=$n_var
pid_greater=$pid
fi

done

ps -p $pid_greater -wwwE | tr ' ' '\n' | grep -o ^.*[[:alpha:]]*\=.*$ | while read var
do
echo $var
done

fi