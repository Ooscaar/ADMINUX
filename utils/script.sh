#!/bin/bash
set -e
FILE=$1

if [ ! $# -eq 1 ]; then
  echo "Incorrect parameters"
  exit 1
fi

echo "Formatic file"
sed -i "s/├/|-/g" $FILE 
sed -i "s/│/|/g"  $FILE 
sed -i "s/┬/-/g"  $FILE 
sed -i "s/─/-/g"  $FILE 
sed -i "s/└/'-/g" $FILE 
echo "Finish"
