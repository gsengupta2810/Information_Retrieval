#!/bin/bash

file="./query.txt"
while read id query
do
	echo $query
	for word in $query
	do 
		echo "$word"
	done 

done < "$file"
