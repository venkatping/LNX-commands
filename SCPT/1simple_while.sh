#!/bin/bash
if [ $# -ne 1 ]
then
echo "usage $0 <number>"
exit 1
else
count=$1
while [ $count -le 20 ]; do
echo "The counter is: $count"
count=$((count+1))
done
fi
