#!/bin/bash

ACTUALCPU=$(top -l 1 | grep -v ^[[:digit:]].*$ | grep ^CPU.*$ | cut -c11-14)
A="$1"
B="$2"
if [[ $ACTUALCPU -lt $A ]]
then
. primefactors.sh &
fi



if [[ $ACTUALCPU -gt $B ]]
then 
kill -STOP "$!"
fi

if [[ $ACTUALCPU -lt $B ]]
then
kill -CONT "$!"
fi



