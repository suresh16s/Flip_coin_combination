declare  -A dic
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
dic[HH]=`echo "scale=2;$tot/$n*100"|bc`
echo ${dic[HH]}
echo "Percent of TT is :"
tot=${dic[TT]}
dic[TT]=`echo "scale=2;$tot/$n*100"|bc`
echo ${dic[TT]}
echo "Percent of HT is :"
tot=${dic[HT]}
dic[HT]=`echo "scale=2;$tot/$n*100"|bc`
echo ${dic[HT]}
echo "Percent of TH is :"
tot=${dic[TH]}
dic[TH]=`echo "scale=2;$tot/$n*100"|bc`
echo ${dic[TH]}
