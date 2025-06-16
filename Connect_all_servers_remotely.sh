#!/bin/bash

# List of servers (replace with your actual server hostnames or IPs)
servers=(
    server1.example.com
    server2.example.com
    server3.example.com
)

# Username for SSH (replace with your actual username)
user="your_ssh_username"

# Output report file
report="df_report_$(date +%Y%m%d_%H%M%S).txt"

echo "Disk Usage Report - $(date)" > "$report"
echo "======================================" >> "$report"

for server in "${servers[@]}"; do
    echo "Connecting to $server..." | tee -a "$report"
    ssh -o BatchMode=yes -o ConnectTimeout=10 "$user@$server" "sudo df -h" >> "$report" 2>&1
    echo "--------------------------------------" >> "$report"
done

echo "Report generated: $report"