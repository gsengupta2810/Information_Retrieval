# #!/bin/bash

echo "Gunjan Here"
echo "again here"

#declare is used for a constant
#can not have space between the name of the variable/constant and the = sign 
declare -r num1=10
#integers can be defined like this 
num=10
#for arithmatic operations have to use $(())
num2=$((num1+num))
num3=$((num1-num))
num4=$((num1/num))

echo "$num1 $num2 $num3 $num4"
#** is used for exponential operator
echo $((5**2))

# ++ -- operators are valid 
#let is used for arithmatic operations too
rand=10
let rand=rand+2
echo "$rand"

#to use python commands we use $() 
number=$(python -c "print $num2+$num3")
echo "$number"

#prints in more than one lines 
cat<<END
THis is to test 
the printing 
of more than one lines 
END

#functions 

getDate(){
	date

	return
}
getDate #this is the function call 
var="global"
func(){
	local var="Local"
	echo "local variable -- $var"
	return
}

echo "$var"
func

#passing attributes to a function 

getSum(){
	local var1=$1 #this refers to the first attribute
	local var2=$2 #2nd attribute
	local sum=$((var1+var2))
	echo $sum
}
var4=10
var5=15
sum=$(getSum var4 var5)
echo "Sum is $sum"

# #taking input from the user 
read -p "Enter age " age
read -p "enter name " name
echo "Hello $name"

#if statement 
#mark the spacings, they need to be exactly according to syntax
if [ $age -ge 16 ] #ge is >= 
then 
	echo "Drive man"
elif [ $age -ge 14 ]
then
	echo "heyy you can learn"
else 
	echo "go home baby"
fi

#also possible in the following way

if ((age>=16)); then
	echo "Drive man"
elif ((age>=14)); then
	echo "go learn first"
else 
	echo "go home and study"
fi

# if statement with strings 
str=""
str1="name"
str2="name"

if [ "$str" ]; then
	echo "$str is not empty "
fi
if [ -z "$str1" ]; then #-z used to check for empty string. returns true if empty 
	echo "string1 has no value "
fi
if [ "$str2" == "$str1" ]; then
	echo "equality bitches"
fi

# creating and handling files
file1="./test_file1.txt"
file2="./test_file2.txt"

# -e -for file exists
# -r file readable 
# -f normal file
# -w writable file

if [ -e "$file1"  ]; then 
	echo "file exists"
else 
	mkdir test_file1.txt
fi

#using normal coding 
read -p "Valid date: " date

pat="^[0-9]{8}$"  #this means pat has to be among and has to be atleast 8 of them
if [[ $date =~ $pat ]]; then
	echo "valid date entered"
fi

# entering more than one variable at a time 

OIFS="$IFS" #by default IFS is set to space 
IFS="/" #space is still a IFS but / will also be accepted as a break
read -p "enter day and month : " day month
echo "date is $day/$month/2016"
#parameter expansion to substitute any white space when these numbers are entered

day=${day//[[:blank:]]/}
month=${month//[[:blank]]/}
IFS="$OIFS"

#parameter expansion 
name="Gunjan"
echo "${name}'s room is 307"

name ="Gunjan Sengupta"
echo "${name//Sengupta/Sen} is the replaced name" # here {variable//word/replacement} is used to replace a particular word in the variable

echo "i am ${name:=Gunjan} " #prints name if existent otherwise prints Gunjan


# case 
read -p "enter age : " age

case $age in
[0-4])
	echo "olelele baby "
	;;
[5-9]|1[0-2])
	echo "you can dance "
	;;
1[3-5]) 
	echo "start to study "
	;;
*)
	echo "too old for school"
	;;
esac

#ternary operator
can_vote=0
age=19

((age >=18 ?(can_vote=1):(can_vote=0)))
echo "can vote : $can_vote"

rand_str="A random string"
echo "String length : ${#rand_str}" #count the length of a string
echo "${rand_str:3}" #char at 3rd index
echo "${rand_str:3:6}" #all chars between 3 and 6
echo "${rand_str#*r}" #everything that follow r


#loops in shell script

num=1
while [ $num -le 10 ]; do  #-le is for less than equal to 
	echo "$num"
	num=$((num+1))
done

num=1
while [ $num -le 20 ]; do
	if (( ((num%2))==0 )); then
		num=$((num+1))
		continue
	fi
	if ((num>=15)); then
		break
	fi
	echo "$num "
	num=$((num+1))
done

#similarly there is until loop
num=1
until [ $num -gt 10 ]; do 
	echo $num
	num=$((num+1))
done

#reading data from a file

while read 	name class roll; do
 printf "Name: ${name}\n Class: ${class}\n Roll: ${roll}\n"
done < test_file.txt 

#for loop

for (( i=0; i<=10; i=i+1 )); do
	echo $i
done

for i in {A..Z}; do 
	echo $i
done

#array 
array=(3.14 1.732 2.178)
echo "Pi at ${array[0]} "
array[3]=1.123
echo "at 4th spot is ${array[3]} "

for i in ${array[*]}; do #replacing * with @ will print out all the indices 
	echo $i
done

#sort an array 
sorted_nums=($(for i in "${array[@]}"; do 
	echo $i
done | sort ))
for i in ${sorted_nums[*]}; do  
	echo $i
done

#delete an array element 
echo "Array length before deleting : ${#sorted_nums[@]}"
unset 'sorted_nums[1]'
echo "Array length after deleting : ${#sorted_nums[@]}"

#positional parameters -- variable that can store data on command line  while running ./*.sh command
echo "1st arguement : $1"
sum=0
while [[ $# -gt 0 ]]; do  # $# will get the values of the parameters 
	num=$1
	sum=$(( sum + num ))
	shift  #shifts tha value of the first parameter to the nexr
done
echo "$sum"

clear
