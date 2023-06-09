#!/bin/sh

if [ $# == 0 ]
then
    echo "Usage: diffodill <file1> <file2>"
elif [ $# -ne 2 ]
then
    echo "Invalid number of arguments"
else
    diff --color $1 $2 > ./output/output.diff
fi
