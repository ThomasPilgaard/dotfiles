#!/bin/bash
raw="$(sensors)"
regex_cpu="k10temp-pci-00c3\s+Adapter:\sPCI\sadapter\s+temp1:\s+\+([[:digit:]]+.[[:digit:]].[[:upper:]])"
if [[ $raw =~ $regex_cpu ]]; then
	temp_cpu="${BASH_REMATCH[1]}"
fi

regex_gpu="radeon-pci-0008\s+Adapter:\sPCI\sadapter\s+temp1:\s+\+([[:digit:]]+.[[:digit:]].[[:upper:]])"
if [[ $raw =~ $regex_gpu ]]; then
	temp_gpu="${BASH_REMATCH[1]}"
fi

echo " CPU: $temp_cpu GPU: $temp_gpu"
