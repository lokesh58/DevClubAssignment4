#!/bin/bash

declare -r exit_code=1;
dir=.
ext=*.*

if [ $# -eq 0 ]; then
	exit $exit_code
else
	dir=$1;
	if [ ! -d "$dir" ]; then
		exit $exit_code
	elif [ ! -r "$dir" ]; then
		exit $exit_code
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
