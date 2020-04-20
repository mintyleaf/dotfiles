#!/bin/bash

source ~/.cache/wal/colors.sh

function main_bar() {
	slstatus -s | lemonbar \
		-B$color0 -F$color7 \
		-f "-gohu-gohufont-medium-r-normal--14-100-100-100-c-80-iso10646-1" \
		-g 1898x34+11+11
}

function border_bar() {
	echo "" | lemonbar -p -B$color1 \
		-g 1904x40+8+8
}

function workspace_bar() {
	wshook | lemonbar \
		-B$color0 -F$color7 \
		-f "-gohu-gohufont-medium-r-normal--14-100-100-100-c-80-iso10646-1" \
		-g 128x34+11+11
}

border_bar & main_bar & sleep 0.1 && workspace_bar
