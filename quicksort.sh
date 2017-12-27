#!/bin/bash

# Quick sort implemetation in bash shell script
#
# Akshay Anand

quicksort() {
	# quicksort: sorts and array in ascending order
	# 			 using randomized quicksort algorithm
	#
	# * param1: the array to sort

	local array=(`echo "$@"`)
	local -a lesser		# array to store items lesser than pivot
	local -a greater	# array to store items greater than pivot
	local -a equal		# array to store items equal to pivot

	if [ ${#array[@]} -lt 2 ]		# if array is has one or no element simply print
		then
		echo ${array[@]}
	else 
		RANDOMINDEX=$(($RANDOM % ${#array[@]}))
		pivot=${array[$RANDOMINDEX]}	# randomly choosing the pivot
		for item in ${array[@]}
		do
			if [ $item -lt $pivot ]
				then
				lesser=( ${lesser[@]} $item )	# append to array "lesser"
			elif [ $item -gt $pivot ]
				then 
				greater=( ${greater[@]} $item )
			else
				equal=( ${equal[@]} $item )
			fi
		done
		# recursive call
		echo `quicksort "${lesser[*]}"` ${equal[@]} `quicksort "${greater[*]}"`
	fi
}


echo -n "Enter total number of elements: "
read n
echo "Enter the elements of the array: "
for (( i=0; i < $n; i++))
do
	read arr[$i]
done

# calling the sorting function
quicksort "${arr[@]}"