#!/bin/bash

echo "entering"
dot="."
txt="txt"
file="./query.txt"
result="./result"
time_grep="./time_grep.txt"
search_results_folder="search_results"

rm -rf $search_results_folder
mkdir $search_results_folder
rm -rf $time_grep
rm -rf result0.txt 

while read id query
do
	echo $id $query
	count=0
	search=""
	temp="$result$count$dot$txt"
	temp1=""
	time_start=$(date +"%s")
	for word in $query 
	do 
		if (( count ==0 ));then
			temp="$result$count$dot$txt"
			grep -iw -r -l "$word" alldocs > $temp
			temp1=$temp
		elif (( count!=0 )) ; then 
			temp="$result$count$dot$txt"
			grep -iw -l "$word" $(cat $temp1) >$temp
			if [[ -s $temp ]] ; then
				rm -rf $temp1
				temp1=$temp
			else
				rm -rf $temp
			fi ;
		fi
		count=$(( count+1 ))
	done
	count=$(( count-1 ))
	temp="result$count$dot$txt"
	temp1="$id$dot$txt"
	mv ./{$temp,$temp1}
	mv ./$temp1 ./$search_results_folder
	time_end=$(date +"%s") 
	time_of_query=$(( time_end-time_start ))
	echo "$id $time_of_query" >> $time_grep
done < "$file"


