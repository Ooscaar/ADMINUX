#!/bin/bash
# AUTHOR: opc 
# DATE: 29/1/21 
# NAME: factorial.sh
# SYNOPSIS: factorial.sh number 
# DESCRIPTION: Computes factorial of number given 
# HISTORY: First version


if [ ! $# -eq 1 ]; then
       echo "Incorrect number of arguments"
       echo "Usage: ./factorial.sh x"       
       exit 1
fi
RESULT=1
NUMBER=$1

while [ $NUMBER -gt 1 ]
do
	RESULT=$(( RESULT * NUMBER ))
	NUMBER=$(( NUMBER - 1))
done
echo $RESULT
