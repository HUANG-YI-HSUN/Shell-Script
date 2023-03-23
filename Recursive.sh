#!/bin/bash
function Print() {
	first=0
	for i in $(ls)
	do
		if [ $first -eq 0 ] ;
		then
			(( first++ ))
		else
			printf ":"
		fi
		printf $i
	done
	printf "\n\n"
} # Print()

function Recursive() {
	printf ">>`pwd`<<\n"
	Print
	
	for i in $(ls)
	do
		apath="`pwd`/$i"
		if [ -d $apath ] ;
		then
			cd $apath
			Recursive
			cd ..
		fi
	done
} # Recursive()

original="`pwd`"
Recursive
cd $original