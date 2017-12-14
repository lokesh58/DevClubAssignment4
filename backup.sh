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

cpdir1todir2() {
	cd $1
	for file in *; do
		if [ -d "$file" ]; then
			if [ ! -d "$2/$file" ]; then
				mkdir $2/$file
			fi
			$(cpdir1todir2 $1/$file $2/$file)
		elif [ ! -f "$2/$file" ]; then
			cp $1/$file $2
		fi
	done
}

cpdir1todir2 $dir1 $dir2
cpdir1todir2 $dir2 $dir1
