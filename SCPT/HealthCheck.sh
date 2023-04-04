#!/bin/bash

# Check system uptime
echo -e "\e[31m\e[4mSystem uptime\033[0m:"
uptime

# Check disk space usage
echo -e "\e[31m\e[4mDisk space usage\033[0m:"
df -h

# Check memory usage
echo -e "\e[31m\e[4mMemory usage\033[0m:"
free -m

# Check CPU usage
echo -e "\e[31m\e[4mCPU usage\033[0m:"
top -bn1 | grep -i "Cpu(s)" | cut -d ":" -f2

# Check system load average
echo -e "\e[31m\e[4mSystem load average\033[0m:"
top -bn1 | grep load | awk '{print $(NF-2)}' | tr -d ,

# Check network interfaces
echo -e "\e[31m\e[4mNetwork interfaces\033[0m:"
ifconfig

# Read Only mountpoints
echo -e "\e[31m\e[4mRead Only MounPoints\033[0m:"
cat /proc/mounts | grep -i ro,

# Filter Output of Mounpoints which are greater than 60%
echo -e "\e[31m\e[4mGreater Than 60% Utilization Mountpoints\033[0m:"
df -ThP | awk '$6 > 30 {print}'

# Top 10 CPU consuming process
echo -e "\e[31m\e[4mTop 10 CPU consuming Processes\033[0m:"
ps -eo pid,ppid,cmd,%mem,%cpu --sort=-%cpu | head -11

# Top 10 memory consuming Processes
echo -e "\e[31m\e[4mTop 10 Memory consuming Processes\033[0m:"
ps -eo pid,ppid,cmd,%mem,%cpu --sort=-%mem | head -11
