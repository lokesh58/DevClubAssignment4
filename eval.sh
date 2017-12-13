#!/bin/bash

declare -r exit_code=1

if [ $# -eq 0 ]; then
	# echo "Insufficient arguments"
	exit $exit_code
fi

file="$1"

if [ ! -r $file ]; then
	# echo "File not readable or doesn't exist"
	exit $exit_code
fi

ans=0

while read num op; do
	case "$op" in
		"+")
			ans=$((ans+num))
			;;
		"-")
			ans=$((ans-num))
			;;
		"*")
			ans=$((ans*num))
			;;
		"/")
			ans=$((ans/num))
			;;
	esac
done < $file

echo "$ans"
