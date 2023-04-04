#!/bin/bash

arr=( "apple" "banana" "grapes" "goa" )
for fruit in ${arr[@]}
do
echo $fruit
done
FRUITS=${#arr[@]}
echo "There are $FRUITS fruits in row"
