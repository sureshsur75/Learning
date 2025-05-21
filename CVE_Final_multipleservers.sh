#!/bin/bash

# Path to the IP-to-CVE mapping file (format: IP_ADDRESS,CVE_NUMBER)
IP_CVE_MAP="ip_cve_map.txt"

# Get the current host's IP address (first non-loopback IPv4)
CURRENT_IP=$(hostname -I | awk '{print $1}')

# Get hostname and OS version
HOSTNAME=$(hostname)
OS_VERSION=$(cat /etc/redhat-release)

# Extract all unique IPs from the map file
ALL_IPS=($(awk -F, '{print $1}' "$IP_CVE_MAP" | sort | uniq))

REPORT="cve_report_$(date +%F).csv"
echo "Hostname,OS Version,IP,CVE,Status" > "$REPORT"

for IP in "${ALL_IPS[@]}"; do
    if [[ "$IP" == "$CURRENT_IP" ]]; then
        # Extract all CVEs for this IP
        CVES_FOR_IP=$(awk -F, -v ip="$IP" '$1 == ip {for(i=2;i<=NF;i++) print $i}' "$IP_CVE_MAP")
        # Validate each CVE for this IP
        while read -r CVE; do
            [[ -z "$CVE" ]] && continue
            if yum updateinfo list installed | grep -q "$CVE"; then
                STATUS="Installed"
            else
                STATUS="Not Installed"
            fi
            echo "\"$HOSTNAME\",\"$OS_VERSION\",\"$IP\",\"$CVE\",\"$STATUS\"" >> "$REPORT"
        done <<< "$CVES_FOR_IP"
    else
        # Only one row for this IP as Not applicable, no CVE details
        echo "\"$HOSTNAME\",\"$OS_VERSION\",\"$IP\",\"N/A\",\"Not applicable\"" >> "$REPORT"
    fi
done

echo "Report generated: $REPORT"

# Run this script for multiple servers from a server list file
SERVER_LIST="server_list.txt"  # Each line should have a server hostname or IP

while read -r server; do
    [[ -z "$server" ]] && continue
    echo "Processing $server ..."
    scp "$0" ip_cve_map.txt "$server":/tmp/
    ssh "$server" 'bash /tmp/'"$(basename "$0")"
done < "$SERVER_LIST"
