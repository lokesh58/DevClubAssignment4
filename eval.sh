#!/bin/bash

file="$1"

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
