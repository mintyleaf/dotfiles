#!/bin/sh

. ~/.cache/wal/colors.sh

trimbg=$(echo $background | cut -c 2-)$
trimfg=$(echo $foreground | cut -c 2-)$
trimc1=$(echo $color1 | cut -c 2-)$
trimc2=$(echo $color2 | cut -c 2-)$
trimc3=$(echo $color3 | cut -c 2-)$
trimc4=$(echo $color4 | cut -c 2-)$
trimc5=$(echo $color5 | cut -c 2-)$
trimc6=$(echo $color6 | cut -c 2-)$
trimc7=$(echo $color7 | cut -c 2-)$
trimc8=$(echo $color8 | cut -c 2-)$

# Set decoration geometry
berryc border_width       3
berryc inner_border_width 3
berryc title_height       0
berryc edge_gap           58 8 8 8

# Set decoration colors
berryc focus_color         $trimc1
berryc unfocus_color       $trimbg
berryc inner_focus_color   $trimbg
berryc inner_unfocus_color $trimc1

# Other options
berryc smart_place "true"
berryc edge_lock   "true"

~/.scripts/redshift.sh &
setxkbmap -layout us,ru -option grp:alt_shift_toggle &
xset fp+ /usr/share/fonts/misc &&
xset fp rehash &&
wal -R &&
~/.scripts/bar_launch.sh &
sxhkd &

picom -C -f -D 1 -I 0.02 -O 0.04 -c -r 1 -l 8 -t 8 --vsync --backend glx --shadow-exclude "_NET_FRAME_EXTENTS@:c"
