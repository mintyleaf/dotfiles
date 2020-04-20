#!/bin/sh

eval $(xdotool getactivewindow getwindowgeometry --shell)
eval $(xdotool getmouselocation --shell)

berryc window_move_absolute $(echo "$X - $WIDTH / 2" | bc) $(echo "$Y - $HEIGHT / 2" | bc)
berryc window_move 0 0
