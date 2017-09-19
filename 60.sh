#!/bin/bash
echo "$0"
echo "$1"
 if [ "$(uname)" == Linux ]
 then
   echo "sei su linux"     
else
      i=0
      echo sono "$0"
      echo "hai passato il processo \""$1"\""
    a=$(top -l 1 -pid "$1"  -stats mem,vsize | grep -v ^[[:alpha:]].*$ | grep -v ^.*/[[:digit:]].*$ )
    for x in $a
    do
    if [[ $i -eq 0 ]]
    then
    REAL="$x"
    else
    VIRTUAL="$x"
    fi
    i=$(($i+1))
    
    done
    
    trap "echo memoria reale = "$REAL""  SIGINT
  
    
    fi