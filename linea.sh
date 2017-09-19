#!/bin/bash

trap "exit" SIGSTOP

trap "while true
do
printf %s \*
done" SIGINT


trap "while true
do
printf %s \* | rev
done" SIGTERM

while true
do
printf "\t\t\t\t%s\n" \*
done
