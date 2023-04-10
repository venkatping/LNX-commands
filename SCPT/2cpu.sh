#!/bin/bash
HOSTNAME=$(hostname)
DATET=$(date "+%Y-%m-%d %H:%M:%S")
CPUUSAGE=$(top -b -n 5 -d 2 | grep "Cpu(s)" | tail -n 1 | awk '{print $2}' | awk -F '.' '{print $1}')
MEMUSAGE=$(free | grep Mem | awk '{print $3/$2 * 100.0}')
DISKUSAGE=$(df -h / | awk '{print $5}' | grep -v "Use" | sed 's/%//g')
echo -e "Hostname|\tDate&Time|\tCPU(%)|\tMEM(%)|\tDISK(%)"
echo -e "${HOSTNAME}|${DATET}|${CPUUSAGE}|${MEMUSAGE}|${DISKUSAGE}"
