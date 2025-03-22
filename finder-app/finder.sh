#!/bin/bash

if [ $# -ne 2 ]
then
    exit 1;
fi

FILESDIR=$1;
SEARCHSTR=$2;

if [ -d "$FILESDIR" ]
then
    FILESNUMBER=$(ls $FILESDIR -1 | wc -l);
    MATCHINGLINES=$(grep -R $SEARCHSTR $FILESDIR | wc -l);
    echo "The number of files are ${FILESNUMBER} and the number of matching lines are ${MATCHINGLINES}";
    exit 0;
else
    echo "$FILESDIR is not a directory";
    exit 1;
fi
