#!/bin/bash

#praticamente il codice del webcrawler del pdf, cambiano solo gli ultimi due righi.



extract ()
{
curl -s $1 | egrep -o 'http[s]?://([[:alnum:]-]+\.){1,5}[[:alnum:]]+'| sort | uniq
}



START=$1
SITES=($(extract $START))
NEWSITES=( )
for ((i=1; i<=$2; i++))
do
for j in ${SITES[*]}
do
NEWSITES=(${NEWSITES[*]} $(extract $j))
done
unset SITES
SITES=($(for k in ${NEWSITES[*]}; do echo $k; done | sort | uniq |
sed s/'https:\/\/'//g | sed s/'http:\/\/'//g))
done
for i in ${SITES[*]}
do
echo $(curl -I  --connect-timeout 30 $1 2>/dev/null | grep Server  )
done | sort | uniq -c

