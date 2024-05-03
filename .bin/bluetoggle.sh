#!/bin/bash
INFO=$(bluetoothctl show)
if $(echo "$INFO" | grep -q "Powered: yes"); then
    bluetoothctl power off
else
    bluetoothctl power on
fi
