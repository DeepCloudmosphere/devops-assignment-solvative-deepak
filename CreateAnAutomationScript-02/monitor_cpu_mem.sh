#!/bin/bash
# ----------------------------------------------------------
# System Monitor Script
# Checks CPU and Memory usage and lists top-consuming processes
# ---------------------------------------------------------

LOG_FILE="/var/log/system_monitor.log"
DATE=$(date '+%Y-%m-%d %H:%M:%S')

# Create log file if it doesn't exist 
mkdir -p "$(dirname "$LOG_FILE")" 
touch "$LOG_FILE" 
 
echo "===============================" >> "$LOG_FILE"
echo "System Resource Report - $DATE" >> "$LOG_FILE" 
echo "===============================" >> "$LOG_FILE" 


# CPU usage
CPU_USAGE=$(top -bn1 | grep "Cpu(s)" | awk '{print 100 - $8"%"}') 
echo "CPU Usage: $CPU_USAGE" >> "$LOG_FILE" 

# Memory usage
MEM_USAGE=$(free -m | awk '/Mem:/ {printf("%.2f%%"), $3/$2*100}') 
echo "Memory Usage: $MEM_USAGE" >> "$LOG_FILE" 

# Top 5 processes by CPU
echo -e "\nTop 5 CPU-consuming processes:" >> "$LOG_FILE" 
ps -eo pid,comm,%cpu,%mem --sort=-%cpu | head -n 6 >> "$LOG_FILE" 
 
# Top 5 processes by Memory 
echo -e "\nTop 5 Memory-consuming processes:" >> "$LOG_FILE" 
ps -eo pid,comm,%cpu,%mem --sort=-%mem | head -n 6 >> "$LOG_FILE" 
 
echo -e "\n" >> "$LOG_FILE" 

# Optional: print summary to terminal 
echo "Report saved to $LOG_FILE" 
echo "CPU Usage: $CPU_USAGE | Memory Usage: $MEM_USAGE" 

