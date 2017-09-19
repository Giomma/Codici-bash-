#!/bin/bash
num=0
pid=0

lsof -i | grep ^.*TCP.*$ | awk '{printf "%s\n",$2}' | uniq | while read string
do
echo $string
i=$(lsof -i -p "$string" | grep ^.*TCP.*$ | wc -l)
echo $i
if [[ $i -gt $num ]]
then
echo $i
num=$i
echo $num
pid=$string
fi
done

echo Il processo che ha più connessioni TCP attive è il numero $pid che ne ha $num
