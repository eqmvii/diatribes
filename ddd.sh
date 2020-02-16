#!/bin/bash

# Simple script to create a journal entry for a given day, in an appropriately structured folder system

echo "Creating Journal file for today, $(date)"
NOW=date
YEAR=$($NOW | awk '{ print $6 }')
MONTH=$($NOW | awk '{ print $2 }')
DAY=$($NOW | awk '{ print $3 }')-$($NOW | awk '{ print $1 }')

if [ -d $YEAR ]
then
    echo $YEAR directory already exists
else
    mkdir $YEAR
fi

cd ./$YEAR

if [ -d $MONTH ]
then
    echo $MONTH directory already exists
else
    mkdir $MONTH
fi

cd ./$MONTH

if [ -f $DAY ]
then
    echo $DAY directory already exists
else
    touch "$DAY.md"
fi

echo $(pwd)
echo $(ls)

# TODO: put a header on top of the markdown file
# TODO: open the markdown file