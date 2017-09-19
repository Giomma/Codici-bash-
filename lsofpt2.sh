#!/bin/bash
touch log.txt
ps aux | grep -v ^.*root.*$ | awk '{printf "%s\n", $2}' | grep -v ^.*[[:alpha:]].*$ | while read processi
do
file_aperti=$(lsof -p $processi | awk '{printf "%s\n", $9}' | grep ^.*"$1".*$)

if [[ -z "${file_aperti// }" ]]
then 
continue 
fi

echo rilevamento file in data $(date)

echo $(date) - PID "$processi" -  $( ps -o ruid "$processi") - PATH $(ps -o command "$processi")  - FILE "$file_aperti" >> log.txt 


done