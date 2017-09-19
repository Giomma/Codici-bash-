#!/bin/bash

echo hai inserito l\'ip "$1"

traceroute  104.20.50.118 | awk '{printf "%s\n" ,$3}' | tr '(',')' ' ' | while read string
do 
if [ "$string" == "*" ]
then
continue
 fi
 echo hop a "$string"
 time=$(ping -c 1 "$string"| awk '{printf "%s\n" , $7}' | grep ^.*time.*$)
 echo per raggiungere "$string" si è usata una velocità "$time"
 
 
 done