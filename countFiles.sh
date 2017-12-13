#!/bin/bash

dir=.
ext=*.*

if [ $# -eq 0 ]; then
	return -1
else
	dir=$1;
	if [ ! -d "$dir" ]; then
		return -1
	elif [ ! -r "$dir" ]; then
		return -1
	fi

	if [ $# -gt 1 ]; then
		ext=*$2
	fi
fi

count=0

for file in ${dir}/$ext; do
	(( count++ ))
done

echo $count
