#!/bin/sh
. "${HOME}/.cache/wal/colors.sh"

dmenu_run_history  -nb "$color0" -nf "$color1" -sb "$color1" -sf "$color0" -l 10 -c
