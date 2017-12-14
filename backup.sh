#!/bin/bash

declare -r exit_code=1

if [ $# -lt 2 ]; then
	exit $exit_code
fi

dir1=$1
dir2=$2

if [ ! -d "$dir1" -o ! -r "$dir1" ]; then
	# echo "$dir1 not valid"
	exit $exit_code
fi

if [ ! -d "$dir2" -o ! -r "$dir2" ]; then
	# echo "$dir2 not valid"
	exit $exit_code
fi

declare -a dir1todir2
declare -a dir2todir1

for file in $dir1/*; do
	echo "$file"
done

for file in $dir2/*; do
	echo "$file"
done
