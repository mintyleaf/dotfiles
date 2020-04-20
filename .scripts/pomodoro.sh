#!/bin/bash

clear

WORK_C=0
BREAK_C=0
CYCLES=0

while [ $CYCLES -lt $3 ]
do
	echo "[WORK] $(($1 - WORK_C)) mins left"
	sleep 60
	clear
	WORK_C=$((WORK_C + 1))
	if [ $WORK_C -eq $1 ]
	then
		aplay ~/Rings/$(ls ~/Rings | sort -R | tail -1) &> /dev/null &
		PID=$!
		read -n 1 -s -r -p "End pomodoro"
		kill $PID
		clear
		WORK_C=0
		if [ $((CYCLES + 1)) -eq $3 ]
		then
			break
		fi
		while true
		do
			echo "[BREAK] $(($2 - BREAK_C)) mins left"
			sleep 60
			clear
			BREAK_C=$((BREAK_C + 1))
			if [ $BREAK_C -eq $2 ]
			then
				aplay ~/Rings/$(ls ~/Rings | sort -R | tail -1) &> /dev/null &
				PID=$!
				read -n 1 -s -r -p "Dismiss"
				kill $PID
				clear
				BREAK_C=0
				read -n 1 -s -r -p "New pomodoro"
				clear
				CYCLES=$((CYCLES + 1))
				break
			fi
		done
	fi
done
clear
echo "End of session"
