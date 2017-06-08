#!/bin/bash
load=$(uptime | sed 's/.*load average: //' | awk -F\, '{print $1, $2, $3}')
echo " $load"
