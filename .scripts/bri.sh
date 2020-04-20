#!/bin/bash
brightness_file='/sys/class/backlight/*/brightness'

# check if one or more arguments were given
if [ $# -eq 0 ] # no arguments given
then
	echo Set brightness to:
	read input
	brightness=$input
else
	case $1 in
		-*)
			brightness=$(echo $(cat $brightness_file) - $(echo $1 | cut -c2-) | bc)
		;;
		+*)
			brightness=$(echo $(cat $brightness_file) + $(echo $1 | cut -c2-) | bc)
		;;
		*)
			brightness=$1 # sets brightness variable as the first argument given
		;;
	esac
	if [ $brightness -gt 1666 ]
	then
		brightness=1666
	fi
	if [ $brightness -lt 100 ]
	then
		brightness=100
	fi
fi 

sudo truncate -s 0 $brightness_file 
echo "$brightness" | sudo tee -a $brightness_file
