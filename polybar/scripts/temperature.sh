#!/bin/bash
gpu_temp=$(sensors | grep 'temp1' | awk '{print $2}' | sed 's/+//')
icon="" # Font Awesome icon for temperature
echo "$icon GPU Temp: $gpu_temp°C"

