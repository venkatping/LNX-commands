#!/bin/bash
if [ $# -ne 1 ];then
echo "usage $0 <THRESHOLD>"
fi

THRESHOLD=$1
DISK_USAGE=$(df -h --output=source,size,used,avail,pcent | sort -k5 -n -r)

while read -r line; do
if [[ $line == *"Filesystem"* ]]; then
 continue
fi
USAGE=$(echo "$line" | awk '{print $5}' | cut -d'%' -f1)
if [ $USAGE -gt $THRESHOLD ]; then
MOUNT=$(echo "$line" | awk '{print $1}')
echo "WARNING: Disk usage for $MOUNT is over $THRESHOLD% ($USAGE%)"
fi
done <<< "$DISK_USAGE"
