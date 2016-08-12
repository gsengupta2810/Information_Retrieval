#!/bin/bash

echo "entering"

file="./query.txt"

rm -rf time_grep.txt

while IFS=: read query
do
	echo "$query"
    cd alldocs
    time_start=$(date +"%s")
    grep -i -r "$query" . 
 	time_end=$(date +"%s") 
    cd ..  
    time_of_query=$(( time_end-time_start ))
 	echo "$time_of_query " >> time_grep.txt  
done < "$file"