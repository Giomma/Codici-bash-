#!/bin/bash
maxname=0
maxsize=0
cd /bin

commands=$(ls | grep -v "\[" |tr '\n' ' ')

for x in $commands
do
echo "$x"
trial_size=$(cat $x | wc -c)

if [[ "$trial_size" -gt "$maxsize" ]]
then
maxsize="$trial_size"
maxname="$x"
fi

done
 
 echo  il processo "$maxname" è il più grande con una dimensione \(conta caratteri\) di "$maxsize" caratteri