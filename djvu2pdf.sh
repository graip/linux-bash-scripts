#!/bin/bash

# Check if djvups and ps2pdf are installed, otherwise prompt

if ! hash djvups 2>/dev/null; then
	read -p "djvups not installed, proceed with installation? " -n 1 -r
	echo
	if [[ $REPLY =~ ^[Yy]$ ]]
	then
		echo -e "Installing djvups...\n"
		gksudo apt-get install djvups
	else
		echo "Exiting."
		exit 1
	fi
fi
	
if ! hash ps2pdf 2>/dev/null; then
	read -p "ps2pdf not installed, proceed with installation? " -n 1 -r
	echo
	if [[ $REPLY =~ ^[Yy]$ ]]
	then
		echo -e "Installing ps2pdf...\n"
		gksudo apt-get install ps2pdf
	else
		echo "Exiting."
		exit 1
	fi
fi

# Convert file

file=$(basename "$1")
#extension="${file##*.}"
filename="${file%.*}"

djvups "$1" temp.ps
ps2pdf temp.ps "$filename".pdf

rm temp.ps
