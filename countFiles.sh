#!/bin/bash

dir=.
ext=*.*

if [ $# -eq 0 ]; then
	exit -1
else
	dir=$1;
	if [ ! -d "$dir" ]; then
		exit -1
	elif [ ! -r "$dir" ]; then
		exit -1
	fi

	if [ $# -gt 1 ]; then
		ext=*$2
	fi
fi

count=0

for file in ${dir}/$ext; do
	if [ "$file" != "${dir}/$ext" ]; then
		(( count++ ))
	fi
done

echo $count
