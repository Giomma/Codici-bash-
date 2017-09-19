#!/bin/bash

while getopts "bp" OPTION
do
    case $OPTION in
        b)  
            echo $OPTION
            echo "polly want a banana"
            ;;
        p)
            echo "polly want a cracker"
            ;;
    esac
done 