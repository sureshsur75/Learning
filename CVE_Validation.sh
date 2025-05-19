#!/bin/bash

# File containing list of CVEs to validate (one per line)
CVE_LIST_FILE="cve_list.txt"

# File containing list of servers (one per line)
SERVER_LIST_FILE="servers.txt"

# Output file for affected CVEs, include local hostname
HOSTNAME=$(hostname)
AFFECTED_CVES_FILE="affected_cves_${HOSTNAME}.txt"

# Check if CVE list file exists
if [[ ! -f "$CVE_LIST_FILE" ]]; then
    echo "CVE list file '$CVE_LIST_FILE' not found."
    exit 1
fi

# Check if server list file exists
if [[ ! -f "$SERVER_LIST_FILE" ]]; then
    echo "Server list file '$SERVER_LIST_FILE' not found."
    exit 1
fi

# Clear previous output
> "$AFFECTED_CVES_FILE"

echo "Validating CVEs from $CVE_LIST_FILE on servers from $SERVER_LIST_FILE..."

while read -r SERVER; do
    if [[ -z "$SERVER" ]]; then
        continue
    fi
    echo "Checking on server: $SERVER"
    while read -r CVE; do
        if [[ -z "$CVE" ]]; then
            continue
        fi
        # Check if the CVE is present in the system using 'yum updateinfo' via SSH
        ssh "$SERVER" "yum updateinfo list all | grep -q '$CVE'"
        if [[ $? -eq 0 ]]; then
            echo "$CVE is AFFECTED on $SERVER"
            echo "$CVE,$SERVER" >> "$AFFECTED_CVES_FILE"
        else
            echo "$CVE is NOT affected on $SERVER"
        fi
    done < "$CVE_LIST_FILE"
done < "$SERVER_LIST_FILE"

echo "Affected CVEs are listed in $AFFECTED_CVES_FILE"

# Prompt user to send report to remote host
read -p "Do you want to send the report to a remote host? (y/n): " SEND_REPORT
if [[ "$SEND_REPORT" =~ ^[Yy]$ ]]; then
    read -p "Enter remote username@host (e.g., user@remotehost): " REMOTE_HOST
    read -p "Enter destination path on remote host (e.g., /tmp/): " REMOTE_PATH
    if [[ -n "$REMOTE_HOST" && -n "$REMOTE_PATH" ]]; then
        scp "$AFFECTED_CVES_FILE" "$REMOTE_HOST":"$REMOTE_PATH"
        if [[ $? -eq 0 ]]; then
            echo "Report sent successfully to $REMOTE_HOST:$REMOTE_PATH"
        else
            echo "Failed to send report to remote host."
        fi
    else
        echo "Remote host or path not provided. Skipping report transfer."
    fi
fi