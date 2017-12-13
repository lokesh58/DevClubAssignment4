#!/bin/bash

declare -r exit_code=1

file=$1
user=$2
OIFS="$IFS"

if [ ! -r "$file" ]; then
	echo "File doesn't exist or not readable"
	exit $exit_code
fi

if [ $# -lt 2 ]; then
	# echo "Insufficient Arguments"
	exit $exit_code
fi

while read line; do
	# echo $line
	if [[ "$line" != *":x:"*":"*":"*":"*":"* ]]; then
		# echo "Incorrect format"
		exit $exit_code
	fi
	
	IFS=":"

	read -r -a attr <<< "$line"
	if [ "${attr[0]}" == "$user" ]; then
		echo "${attr[4]}"
		exit 0
	fi

	IFS=$OIFS
done < "$file"

echo "Invalid Username"
