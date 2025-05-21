#!/bin/bash

# File containing list of servers (one per line)
SERVER_LIST="servers.txt"

# Path to the existing script to run remotely
REMOTE_SCRIPT_PATH="/path/to/existing_script.sh"

# Remote user
REMOTE_USER="youruser"

# Report file name (with timestamp)
REPORT_FILE="cve_report_$(date +%Y%m%d_%H%M%S).txt"

# Loghost details
LOGHOST="loghost.example.com"
LOGHOST_USER="loguser"
LOGHOST_DEST_PATH="/path/to/log/directory/"

# Run the script on all servers in parallel with sudo and collect output
> "$REPORT_FILE"
while read -r SERVER; do
    [[ -z "$SERVER" ]] && continue
    ssh "${REMOTE_USER}@${SERVER}" "sudo bash -s" < "$REMOTE_SCRIPT_PATH" \
        | sed "s/^/[$SERVER] /" >> "$REPORT_FILE" &
done < "$SERVER_LIST"

# Wait for all background jobs to finish
wait

# Send the report to the loghost using scp
scp "$REPORT_FILE" "${LOGHOST_USER}@${LOGHOST}:${LOGHOST_DEST_PATH}"

echo "Report sent to ${LOGHOST}:${LOGHOST_DEST_PATH}${REPORT_FILE}"