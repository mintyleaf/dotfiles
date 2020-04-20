#!/bin/sh
. "${HOME}/.cache/wal/colors.sh"

dmenu -nb "$color0" -nf "$color1" -sb "$color1" -sf "$color0" "$@"
