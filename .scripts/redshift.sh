#!/bin/sh

LOC=$(curl ipinfo.io/loc)
LAT="$(echo $LOC | cut -f 1 -d ',')"
LON="$(echo $LOC | cut -f 2 -d ',')"

redshift -l "$LAT:$LON"
