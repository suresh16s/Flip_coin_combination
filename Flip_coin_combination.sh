#!/bin/bash
declare -A coinSinglet coinDoublet coinTriplet
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
percentageH=`echo "scale=2; $tot/$n"| bc`
echo $percentageH

val=${dic[T]}
echo "Percent of tails is :"
percentageT=`echo "scale=2; $val/$n"| bc`
echo $percentageT
coinSinglet=([H]=$percentageH [T]=$percentageT)

dic[HH]=0
dic[TT]=0
dic[TH]=0
dic[HT]=0
read -p "Enter the flip:" n

for ((i=0;i<$n;i++))
do
	r=$((RANDOM%4))
	if [ $r -eq 0 ]
	then
		tot=${dic[HH]}
		dic[HH]=$((tot+1))
	elif [ $r -eq 1 ]
	then
		tot=${dic[TT]}
		dic[TT]=$((tot+1))
	elif [ $r -eq 2 ]
	then
		tot=${dic[HT]}
		dic[HT]=$((tot+1))
	else
		tot=${dic[TH]}
		dic[TH]=$((tot+1))
	fi
done

echo "Percent of HH is :"
tot=${dic[HH]}
pecentageHH=`echo "scale=2;$tot/$n*100"|bc`
echo $pecentageHH

echo "Percent of TT is :"
tot=${dic[TT]}
percentageTT=`echo "scale=2;$tot/$n*100"|bc`
echo $percentageTT

echo "Percent of HT is :"
tot=${dic[HT]}
percentageHT=`echo "scale=2;$tot/$n*100"|bc`
echo $percentageHT

echo "Percent of TH is :"
tot=${dic[TH]}
percentageTH=`echo "scale=2;$tot/$n*100"|bc`
echo $percentageTH
coinDoublet=([HH]=$percentageHH [HT]=$percentageHT [TH]=$percentageTH [TT]=$percentageTT)


dic[TTT]=0
dic[TTH]=0
dic[THT]=0
dic[HTT]=0
dic[HTH]=0
dic[HHT]=0
dic[THH]=0
dic[HHH]=0
read -p "Enter the flip:" n

for ((i=0;i<$n;i++))
do
	r=$((RANDOM%8))
	if [ $r -eq 0 ]
	then
		tot=${dic[TTT]}
		dic[TTT]=$((tot+1))
	elif [ $r -eq 1 ]
	then
		tot=${dic[TTH]}
		dic[TTH]=$((tot+1))
	elif [ $r -eq 2 ]
	then
		tot=${dic[THT]}
		dic[THT]=$((tot+1))
	elif [ $r -eq 3 ]
	then
		tot=${dic[HTT]}
		dic[HTT]=$((tot+1))
	elif [ $r -eq 4 ]
	then
		tot=${dic[HHT]}
		dic[HHT]=$((tot+1))
	elif [ $r -eq 5 ]
	then
		tot=${dic[HTH]}
		dic[HTH]=$((tot+1))
	elif [ $r -eq 6 ]
	then
		tot=${dic[THH]}
		dic[THH]=$((tot+1))
	else
		tot=${dic[HHH]}
		dic[HHH]=$((tot+1))
	fi
done


echo "Percent of TTT is :"
tot=${dic[TTT]}
percentageTTT=`echo "scale=2;$tot/$n"| bc`
echo $percentageTTT

echo "Percent of TTH is :"
tot=${dic[TTH]}
percentageTTH=`echo "scale=2;$tot/$n"| bc`
echo $percentageTTH


echo "Percent of THT is :"
tot=${dic[THT]}
percentageTHT=`echo "scale=2;$tot/$n"| bc`
echo $percentageTHT

echo "Percent of HTT is :"
tot=${dic[HTT]}
percentageHTT=`echo "scale=2;$tot/$n"| bc`
echo $percentageHTT


echo "Percent of HTH is :"
tot=${dic[HTH]}
percentageHTH=`echo "scale=2;$tot/$n"| bc`
echo $percentageHTH


echo "Percent of HHT is :"
tot=${dic[HHT]}
percentageHHT=`echo "scale=2;$tot/$n"| bc`
echo $percentageHHT


echo "Percent of THH is :"
tot=${dic[THH]}
percentageTHH=`echo "scale=2;$tot/$n"| bc`
echo $percentageTHH


echo "Percent of HHH is :"
tot=${dic[HHH]}
percentageHHH=`echo "scale=2;$tot/$n"| bc`
echo $percentageHHH
        coinTriplet=([HHH]=$percentageHHH [HTH]=$percentageHTH [THH]=$percentageTHH [TTH]=$percentageTTH \
	[HHT]=$percentageHHT [THT]=$percentageTHT [HTT]=$percentageHTT [TTT]=$percentageTTT)

Dictionary() {
	for i in "${!coinDoublet[@]}"
	do
		coinSinglet[$i]=${coinDoublet[$i]}
	done
	for i in "${!coinTriplet[@]}"
	do
		coinSinglet[$i]=${coinTriplet[$i]}
	done
}
Sort() {
        IFS=$'\n' Sorted=($(sort -nr <<<"${coinSinglet[*]}"))
	unset IFS
	for i in "${!coinSinglet[@]}"
	do
		[[ ${Sorted[0]} -ne ${coinSinglet[$i]} ]] && continue
		echo "winnig combination is $i"; return;
	done
}
Dictionary
Sort
