#!/bin/bash
# AUTHOR: opc
# DATE: 28/1/2021 
# NAME: squareroot.sh
# SYNOPSIS: root.sh number
# DESCRIPTION: Computes root square of number given
# HISTORY: First version

square() {
  local CAT1 CAT2 RESULT
  CAT1=$1
  CAT2=$2
  ((RESULT = (CAT1**2 + CAT2**2) ** 1/2))
  echo $RESULT
}
if [ ! $# -eq 2 ]; then
	echo "Incorrect number of arguments"
	exit 1
fi

echo "Square root of "
echo "$1"
echo "$2"
echo "Result"
square "$1" "$2"
exit 0
