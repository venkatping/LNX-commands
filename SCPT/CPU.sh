#!/bin/bash

# Get the number of CPUs
num_cpus=$(grep -c ^processor /proc/cpuinfo)

# Get the current time
current_time=$(date +"%Y-%m-%d %H:%M:%S")

# Get the CPU usage as a percentage
cpu_usage=$(top -bn1 | grep "Cpu(s)" | awk '{print $2 + $4}')

# Calculate the CPU usage as a percentage per CPU
cpu_usage_per_cpu=$(echo "scale=2; $cpu_usage / $num_cpus" | bc)

# Print the results
echo "Time: $current_time"
echo "CPU Usage: ${cpu_usage}%"
echo "CPU Usage per CPU: $cpu_usage_per_cpu"
