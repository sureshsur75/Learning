#!/bin/bash

# Usage: ./package.sh

CVE_FILE="/tmp/cve.txt"
REPORT_FILE="/tmp/$(hostname -f)_$(date +%Y%m%d).txt"
> "$REPORT_FILE"

if [[ -z "$CVE_FILE" || ! -f "$CVE_FILE" ]]; then
    echo "Usage: $0 <cve_file>"
    exit 1
fi

INSTALLED_ADVISORIES=$(dnf updateinfo list --installed)

# Get all IP addresses of this host
HOST_IPS=$(hostname -I 2>/dev/null)

while read -r line; do
    [[ -z "$line" ]] && continue
    # Each line: <IP> <CVE1> <CVE2> ...
    IP=$(echo "$line" | awk '{print $1}')
    [[ -z "$IP" ]] && continue

    if echo "$HOST_IPS" | grep -wq "$IP"; then
        # For each CVE in the line (fields 2 and onward)
        for CVE in $(echo "$line" | awk '{for(i=2;i<=NF;i++)print $i}'); do
            [[ -z "$CVE" ]] && continue
            MATCH=$(echo "$INSTALLED_ADVISORIES" | grep -i "$CVE")
            if [[ -n "$MATCH" ]]; then
                for ADV in $(echo "$MATCH" | awk '{print $1}'); do
                    echo "$CVE ($IP) - $ADV - INSTALLED" >> "$REPORT_FILE"
                done
            else
                # Try to find advisory name from all advisories (not just installed)
                ALL_ADVISORIES=$(dnf updateinfo list all | grep -i "$CVE")
                if [[ -n "$ALL_ADVISORIES" ]]; then
                    for ADV in $(echo "$ALL_ADVISORIES" | awk '{print $1}'); do
                        echo "$CVE ($IP) - $ADV - NOT INSTALLED" >> "$REPORT_FILE"
                    done
                else
                    echo "$CVE ($IP) - NO_ADVISORY - NOT INSTALLED" >> "$REPORT_FILE"
                fi
            fi
            echo "" >> "$REPORT_FILE"
            echo "" >> "$REPORT_FILE"
        done
    else
        # If IP does not match, report as NOT APPLICABLE and skip CVEs
        echo "$IP - NOT APPLICABLE" >> "$REPORT_FILE"
        echo "" >> "$REPORT_FILE"
        echo "" >> "$REPORT_FILE"
    fi
done < "$CVE_FILE"

echo "Report generated at $REPORT_FILE"