#!/bin/bash

declare -r exit_code=1

if [ $# -lt 2 ]; then
	exit $exit_code
fi

dir0=$PWD
dir1=$1
dir2=$2
display=0

if [ $# -eq 4 ]; then
	display=$3
	app=$4
fi

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

cd $dir1

if [ $display -eq 0 ]; then
	echo "Files copied from $1 to $2 are:"
	for file in *; do
		if [ ! -d "$file" ]; then
			if [ ! -e "${dir2}/$file" ]; then
				echo "$file"
			fi
		fi
	done
fi

for file in *; do
	# echo "$file"
	if [ -d "$file" ]; then
		if [ ! -d "${dir2}/$file" ]; then
			mkdir ${dir2}/$file
		fi
		cd $dir0
		if [ $display -eq 0 ]; then
			arg4=$file
		else
			arg4=$app/$file
		fi
		$0 ${dir1}/$file ${dir2}/$file 1 $arg4
		cd $dir1
	elif [ ! -f "${dir2}/$file" ]; then 
		cp ${dir1}/$file ${dir2}
		if [ $display -eq 1 ]; then
			echo "$app/$file"
		fi
	fi
done

cd $dir2

if [ $display -eq 0 ]; then
	echo "Files copied from $2 to $1 are:"
	for file in *; do
		if [ ! -d "$file" ]; then
			if [ ! -e "${dir1}/$file" ]; then
				echo "$file"
			fi
		fi
	done
fi

for file in *; do
	# echo "$file"
	if [ -d "$file" ]; then
		if [ ! -d "${dir1}/$file" ]; then
			mkdir ${dir1}/$file
		fi
		cd $dir0
		if [ $display -eq 0 ]; then
			arg4=$file
		else
			arg4=$app/$file
		fi
		$0 ${dir2}/$file ${dir1}/$file 2 $arg4
		cd $dir2
	elif [ ! -f "${dir1}/$file" ]; then
		cp ${dir2}/$file ${dir1}
		if [ $display -eq 2 ]; then
			echo "$app/$file"
		fi
	fi
done
cd $dir0
