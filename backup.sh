#!/bin/bash

declare -r exit_code=1

if [ $# -lt 2 ]; then
	exit $exit_code
fi

dir0=$PWD
dir1=$1
dir2=$2

if [ ! -d "$dir1" -o ! -r "$dir1" ]; then
	# echo "$dir1 not valid"
	exit $exit_code
else
	cd $dir1
	dir1=$PWD
	# echo "$dir1"
	cd $dir0
fi

if [ ! -d "$dir2" -o ! -r "$dir2" ]; then
	# echo "$dir2 not valid"
	exit $exit_code
else
	cd $dir2
	dir2=$PWD
	# echo "$dir2"
	cd $dir0
fi

declare -a dir1todir2
declare -a dir2todir1

cd $dir1
for file in *; do
	# echo "$file"
	if [ -d "$file" ]; then
		echo "Folder $file not synced"
	elif [ ! -f "${dir2}/$file" ]; then 
		cp ${dir1}/$file ${dir2}
	fi
done
cd $dir0

cd $dir2
for file in *; do
	# echo "$file"
	if [ -d "$file" ]; then
		echo "Folder $file not synced"
	elif [ ! -f "${dir1}/$file" ]; then
		cp ${dir2}/$file ${dir1}
	fi
done
cd $dir0
