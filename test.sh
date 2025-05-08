#!/bin/bash

# List of hosts to ping
hosts=("google.com" "yahoo.com" "bing.com")

# Loop through each host and ping
for host in "${hosts[@]}"; do
    echo "Pinging $host..."
    if ping -c 4 "$host" > /dev/null 2>&1; then
        echo "$host is reachable."
    else
        echo "$host is not reachable."
    fi
    echo "----------------------"
done