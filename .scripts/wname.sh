#!/bin/sh
if [ "$(xprop -root _NET_ACTIVE_WINDOW | cut -d ' ' -f 5)" = "0x0" ]
then
	echo "   "
else
	PID="$(xprop -id $(xprop -root _NET_ACTIVE_WINDOW | cut -d ' ' -f 5) _NET_WM_PID | cut -d ' ' -f 3)"
	echo "$(cat /proc/$PID/comm) ($PID)"
fi
