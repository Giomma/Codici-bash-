#!/bin/bash 

#set -x

#Scrivere uno script bash denominato "check_subnet.sh" che prenda in input un indirizzo IP A, la subnet mask B ad esso corrispondente e un altro indirizzo IP C e verifichi se C si trova nella stessa #subnet di A.  
#A, B e C, tutti e tre espressi in notazione decimale quadripuntata ("quad-dotted notation"), siano passati allo script come argomenti sulla linea di comando.


ndq2int(){
a=0
for b in $(echo $1 | tr . " "); do
	a=$((256*$a+$b))
done
echo $a
}

ndq2bin(){

int=$(ndq2int $1)
bin=$({ echo obase=2; echo $int; } | bc)
pad=$((32-${#bin}))
for ((i=0; i<$pad; i++))
do
	bin=0${bin}
done
echo $bin
}

	                                                                                                                                                                             
if [[ ! $1 =~ ^([0-9]|[1-8][0-9]|9[0-9]|1[0-9]{2}|2[01][0-9]|22[0-3])\.(([0-9]|[1-8][0-9]|9[0-9]|1[0-9]{2}|2[0-4][0-9]|25[0-5])\.){2}([0-9]|[1-8][0-9]|9[0-9]|1[0-9]{2}|2[0-4][0-9]|25[0-5])$ ]] ; then
echo "Il primo argomento non è  valido, inserire un indirizzo ip valido"
exit 1
fi


if [[ ! $2 =~ ^255\.(([0-9]|[1-8][0-9]|9[0-9]|1[0-9]{2}|2[0-4][0-9]|25[0-5])\.){2}([0-9]|[1-8][0-9]|9[0-9]|1[0-9]{2}|2[0-4][0-9]|25[0-5])$ ]] ; then
echo "Il secondo argomento non è  valido, inserire una subnet mask valida"
exit 1
fi

if [[ ! $3 =~ ^([0-9]|[1-8][0-9]|9[0-9]|1[0-9]{2}|2[01][0-9]|22[0-3])\.(([0-9]|[1-8][0-9]|9[0-9]|1[0-9]{2}|2[0-4][0-9]|25[0-5])\.){2}([0-9]|[1-8][0-9]|9[0-9]|1[0-9]{2}|2[0-4][0-9]|25[0-5])$ ]] ; then
echo "Il terzo argomento non è  valido, inserire un indirizzo ip valido"
exit 1
fi



ip_1=$(ndq2bin $1)
ip_2=$(ndq2bin $3)
sub=$(ndq2bin $2)

sub_array=($(echo $sub | sed 's/./& /g' | tr " " \\n))
numero_uni=$(echo ${sub_array[@]} | tr " " \\n | uniq -c | head -n1 | awk '{print $1}')

ip_1array=($(echo $ip_1 | sed 's/./& /g' | tr " " \\n))
ip_2array=($(echo $ip_2 | sed 's/./& /g' | tr " " \\n))


for (( i=0 ; i<$numero_uni ; i++ ))
do
	if [ ! ${ip_1array[$i]} == ${ip_2array[$i]} ]; then
	echo "L'indirizzo ip $3 non si trova nella stessa subnet di $1"
	exit 1
	fi
done

echo "I due indirizzi ip si trovano nella medesima subnet"











