#!/bin/bash
# AUTHOR: teacher
# DATE: 4/10/2011
# NAME: clean.sh
# SYNOPSIS: clean.sh (without parameters)
# DESCRIPTION: Removes temporal files in your working directory:
# HISTORY: First version

echo "Really clean this directory?"
// Read and assign it to var YORN
read YORN
// Case statement of var YORN
case $YORN in
	// In case Yorn equal y/Y/s/S
	y|Y|s|S) ACTION=0;;

	// In case Yorn equal n/N
	n|N) ACTION=1;;

	// Otherwise
	*) ACTION=2;;
esac

if [ $ACTION -eq 0 ]; then
	// Remove all files that match the patterns
	// It also looks for invisible files
	rm -f \#* *~ .*~ *.bak .*.bak *.backup *.tmp .*.tmp core a.out
	echo "Cleaned"
	exit 0
elif [ $ACTION -eq 1 ]; then
	echo "Not Cleaned"
	exit 0
elif [ $ACTION -eq 2 ]; then
	echo "$YORN is no an allowed answer. Bye bye"
	exit 1
else
	echo "Uaggg!! Symptomatic Error"
	exit 2
fi
