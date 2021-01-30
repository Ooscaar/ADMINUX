#!/bin/bash
# AUTHOR: teacher
# DATE: 4/10/2011
# NAME: shellinfo.sh
# SYNOPSIS: shellinfo.sh [arg1 arg2 ... argN]
# DESCRIPTION: Provides information about the script.
# HISTORY: First version

echo "My PID is $$"
echo "The name of the script is $0"
echo "The number of parameters received is $#"

if [ $# -gt 0 ]; then
	I=1
	for PARAM in "$@"
	do
		echo "Parameter \$$I is $PARAM"
		((I++))
	done
fi
