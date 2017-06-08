#!/bin/bash
# echo " $(/opt/vc/bin/vcgencmd measure_temp | grep -o '[0-9.]\+') C"
temp=$(/opt/vc/bin/vcgencmd measure_temp)
temp=${temp:5:4}
echo -e " $temp\u00B0C"
