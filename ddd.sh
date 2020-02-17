#!/bin/bash

# Simple script to create a journal entry for a given day, in an appropriately structured folder system

echo "Creating Journal file for today, $(date)"
NOW=$(date "+%A %Y %m %d %B")
YEAR=$(echo $NOW | awk '{ print $2 }')
MONTH=$(echo $NOW | awk '{ print $3 }')-$(echo $NOW | awk '{ print $5 }')
DAY=$(echo $NOW | awk '{ print $4 }')-$(echo $NOW | awk '{ print $1 }')
FILE_NAME=$DAY.md

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

if [ -a $FILE_NAME ]
then
    echo $FILE_NAME file already exists
else
    touch $FILE_NAME
fi

echo $(pwd)
echo $(ls)

# TODO: put a header on top of the markdown file
# TODO: open the markdown file, maybe with nano $FILE_NAME or code $FILE_NAME
