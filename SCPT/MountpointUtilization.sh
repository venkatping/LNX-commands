#!/bin/bash
#DF Command FIELD_LIST  is  a comma-separated list of columns to be included.  Valid field names are:
#       'source', 'fstype', 'itotal',  'iused',  'iavail',  'ipcent',  'size',  'used',  'avail',
#       'pcent', 'file' and 'target' (see info page).
THRESHOLD=40
MOUNTPOINTS=$(df -h --output=target,pcent | sed '1d')
while read -r line; do
mountpoint=$(echo $line | awk '{print $1}')
utilization=$(echo $line | awk '{print $2}' | tr -d '%')

if [ "$utilization" -ge "$THRESHOLD" ]; then
echo "The Mountpoint $mountpoint is highly utilized ($utilization%)"
fi
done <<< "$MOUNTPOINTS"
