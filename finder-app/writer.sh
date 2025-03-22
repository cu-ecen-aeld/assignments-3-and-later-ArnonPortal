#!/bin/bash

if [ $# -ne 2 ]
then
    echo "One of the parameters is missing";
    exit 1;
fi

WRITEFILE=$1;
WRITESTR=$2;

mkdir -p "$(dirname "$WRITEFILE")"
if [ $? -eq 1 ]
then
    echo "Failed to create path"
    exit 1;
fi

touch $WRITEFILE
if [ $? -eq 1 ]
then
    echo "Failed to create a file"
    exit 1;
fi

echo "$WRITESTR" >> "$WRITEFILE"
if [ $? -eq 1 ]
then
    echo "Failed to write into a file"
    exit 1;
fi
exit 0;