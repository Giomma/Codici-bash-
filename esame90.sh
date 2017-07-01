#!/bin/bash 

#set -x
for (( i=1; i<=$#; i++))
do

	echo '------directory' ${!i} '------risultati file regolari'
	array_file=($(ls -l ${!i} | grep '^-'| awk '{print $9}'))
	printf "%-30s  %-30s  %-30s\n" "NAME" "DIM" "BLOCKS"
	for k in ${array_file[@]}
	do
		printf "%-30s  %-30s  %-30s \n" $k $(stat -c%s ${!i}/$k) $(stat -c%b ${!i}/$k)  
	done

	array_dir=($(ls -al ${!i} | awk '{print $9}'))
	printf \\n
	echo '------directory' ${!i} '------risultati file con directories'
	printf "%-30s  %-30s  %-30s \n" "NAME" "DIM" "BLOCKS"
	for k in ${array_dir[@]}
	do
		if [ -d ${!i}/$k ] ; then
			printf "%-30s  %-30s  %-30s \n " $k $(du -b ${!i}/$k 2> /dev/null | grep ${!i}/$k$ | awk '{printf $1 }') $(stat -c%b ${!i}/$k)  
		else
			printf "%-30s  %-30s  %-30s \n " $k $(stat -c%s ${!i}/$k 2> /dev/null) $(stat -c%b ${!i}/$k) 
		fi
	
	done
	
		
	
	printf \\n\\n\\n
done



	
