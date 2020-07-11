#!/bin/bash
Flip=$((RANDOM % 2))
if [ $Flip -eq 1 ]
then
        echo "Head wins"
else
        echo "Tail wins"
fi

read -p "Enter the flip:" n
declare  -A dic
dic[H]=0
dic[T]=0
for ((i=0;i<$n;i++))
do
	r=$((RANDOM % 2))
	if [ $r -eq 0 ]
	then
		tot=${dic[H]}
		dic[H]=$((tot+1))
	else
		val=${dic[T]}
		dic[T]=$((val+1))
	fi
done
tot=${dic[H]}
echo "Percent of Heads is :"
echo "scale=2; $tot/$n"| bc
val=${dic[T]}
echo "Percent of tails is :"
echo "scale=2; $val/$n"| bc
