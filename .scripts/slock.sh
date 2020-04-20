#!/bin/sh
slock -m "$(cowsay -f $(ls /usr/share/cows | shuf -n1) "$(fortune)")"
