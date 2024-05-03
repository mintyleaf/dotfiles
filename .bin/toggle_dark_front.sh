#!/bin/bash
if [ $(gsettings get org.gnome.desktop.interface color-scheme) == "'prefer-light'" ]; then echo '󰖨'; else echo '󰽥'; fi
