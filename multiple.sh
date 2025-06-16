#!/bin/bash

# File containing list of servers (one per line)
SERVER_LIST="/tmp/servers-list.txt"

# Read server IP addresses from servers-list.txt (one per line)
servers=()
while IFS= read -r line; do
    [[ -z "$line" || "$line" =~ ^# ]] && continue  # skip empty lines and comments
    servers+=("$line")
done < "$SERVER_LIST"

# SSH username and key (replace with your actual username and key path)
ssh_user="hndipat1"
ssh_key="/home/hndipat1/.ssh/ansible_cyberark"

# Directory to create under /tmp
dir_name="CVE_Report"

for server in "${servers[@]}"; do
    echo "Connecting to $server..."
    ssh -o ConnectTimeout=10 -i "$ssh_key" "$ssh_user@$server" "sudo su - -c 'mkdir -p /tmp/$dir_name && chown $ssh_user /tmp/$dir_name'"
    if [ $? -eq 0 ]; then
        echo "Directory /tmp/$dir_name created on $server"
    else
        echo "Failed to create directory on $server"
    fi
done
