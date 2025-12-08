#!/bin/bash

# Simple Ping Sweep Script

if [ -z "$1" ]; then
    echo "Usage: ./ping_sweep.sh <network_prefix>"
    echo "Example: ./ping_sweep.sh 192.168.1"
    exit 1
fi

for host in {1..254}
do
    ip="$1.$host"
    ping -c 1 -W 1 $ip > /dev/null 2>&1

    if [ $? -eq 0 ]; then
        echo "[+] Host $ip is UP"
    fi
done
