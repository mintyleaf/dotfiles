#!/bin/sh
#
# Take a screenshot.

scr_dir=~/Pictures/Screenshots

date=$(date +%F)
time=$(date +%I-%M-%S)
file=$scr_dir/$date/$date-$time.jpg

mkdir -p "$scr_dir/$date"

ffmpeg -y \
    -hide_banner \
    -loglevel error \
    -f x11grab \
    -video_size 1920x1080 \
    -i :0.0 \
    -vframes 1 \
    "$file"

cp -f "$file" "$scr_dir/current.jpg"

sleep 0.1

xclip -sel clip -t image/png < "$scr_dir/current.jpg"
