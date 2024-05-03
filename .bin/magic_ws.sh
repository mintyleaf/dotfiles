#!/bin/sh
awin=$(hyprctl activewindow)

if $(echo "$awin" | grep -q "special:magic"); then
    echo "asd"
    [ "$1" = "down" ] && hyprctl dispatch togglespecialworkspace magic
else
    [ "$1" = "up" ] && hyprctl dispatch togglespecialworkspace magic
fi
