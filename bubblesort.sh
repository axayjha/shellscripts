#!/bin/bash

# Bubble sort implemetation in bash shell script
#
# Akshay Anand


swap() {
	# swaps two elements a[i] and a[j]
	# in an array 'a'
	# 
	# * param1: array variable 'a' to apply swap on
	# * param2: first position i
	# * param3: second position j
	local -n a=$1
	temp=${a[$2]}
	a[$2]=${a[$3]}
	a[$3]=$temp
}

bubblesort() {
	# sorts an array in ascending order
	# 
	# * param1: array variable to sort
	# * param2: length of the array
	local -n array=$1
	len=$2
	for (( i=0; i<${len}; i++));
	do
		for(( j=0; j < $((len-i-1)); j++))
		do
			if [ ${array[$j]} -gt ${array[$((j+1))]} ]
			then
				swap array $j $((j+1))
			fi
		done
	done
}


echo -n "Enter total number of elements: "
read len
echo "Enter the elements of the array: "
for (( i=0; i < $len; i++))
do
	read arr[$i]
done

# calling the sorting function
bubblesort arr $len

echo ${arr[*]}