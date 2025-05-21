#!/bin/bash

# Path to your CVE list file (one CVE per line, e.g., CVE-2023-1234)
CVE_LIST="cve_list.txt"
REPORT="cve_report_$(hostname)_$(date +%F).csv"

# Get hostname and OS version
HOSTNAME=$(hostname)
OS_VERSION=$(cat /etc/redhat-release)

echo "Hostname,OS Version,CVE,Status" > "$REPORT"

while read -r CVE; do
    # Check if CVE is applicable/installed using yum or dnf
    if yum updateinfo list installed | grep -q "$CVE"; then
        STATUS="Installed"
    else
        STATUS="Not Installed"
    fi
    echo "\"$HOSTNAME\",\"$OS_VERSION\",\"$CVE\",\"$STATUS\"" >> "$REPORT"
done < "$CVE_LIST"

echo "Report generated: $REPORT"
