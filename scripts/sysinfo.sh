#!/bin/bash

echo "=================================================="
echo "        DevOps System Information Report"
echo "=================================================="

echo "Current User : $(whoami)"
echo "Hostname     : $(hostname)"
echo "Date         : $(date)"
echo "Kernel       : $(uname -r)"
echo "OS           : $(uname -o)"

echo
echo "------------- Disk Usage -------------------------"
df -h

echo
echo "------------- Memory Usage -----------------------"
free -h

echo
echo "------------- Current Directory ------------------"
pwd

echo
echo "------------- Uptime -----------------------------"
uptime

echo
echo "System information collected successfully."
echo "=================================================="
