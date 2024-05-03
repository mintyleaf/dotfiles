#!/bin/bash
pidof hyprlock || (hyprctl switchxkblayout at-translated-set-2-keyboard 0 && hyprlock -q -i) &
