#!/bin/bash

# Bubble sort implemetation in bash shell script
#
# Akshay Anand


echo -n "Enter total number of elements: "
read len
echo "Enter the elements of the array: "
for (( i=0; i < $len; i++))
do
	read array[$i]
done

# array=(4 7 2 6 9 1)
# len=${#array[@]}

for (( i=0; i<${len}; i++));
do
	for(( j=0; j < $((len-i-1)); j++))
	do
		if [ ${array[$j]} -gt ${array[$((j+1))]} ]
		then
			temp=${array[$j]}
			array[$j]=${array[$((j+1))]}
			array[$((j+1))]=$temp
		fi
	done
done

echo ${array[*]}
