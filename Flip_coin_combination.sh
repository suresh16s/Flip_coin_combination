declare  -A dic
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
echo "scale=2;$tot/$n"| bc

echo "Percent of TTH is :"
tot=${dic[TTH]}
echo "scale=2;$tot/$n"| bc

echo "Percent of THT is :"
tot=${dic[THT]}
echo "scale=2;$tot/$n"| bc

echo "Percent of HTT is :"
tot=${dic[HTT]}
echo "scale=2;$tot/$n"| bc

echo "Percent of HTH is :"
tot=${dic[HTH]}
echo "scale=2;$tot/$n"| bc


echo "Percent of HHT is :"
tot=${dic[HHT]}
echo "scale=2;$tot/$n"| bc


echo "Percent of THH is :"
tot=${dic[THH]}
echo "scale=2;$tot/$n"| bc


echo "Percent of HHH is :"
tot=${dic[HHH]}
echo "scale=2;$tot/$n"| bc
