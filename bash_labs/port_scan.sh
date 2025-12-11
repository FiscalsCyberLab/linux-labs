
#!/bin/bash

# Simple TCP Port Scanner in Bash

if [ -z "$1" ]; then
    echo "Usage: ./port_scan.sh <target_ip> [start_port] [end_port]"
    echo "Example: ./port_scan.sh 192.168.1.1 1 100"
    exit 1
fi

target="$1"
start_port=${2:-1}
end_port=${3:-1024}

echo "Scanning $target from port $start_port to $end_port..."
echo

for port in $(seq "$start_port" "$end_port"); do
    timeout 0.2 bash -c "echo >/dev/tcp/$target/$port" 2>/dev/null

    if [ $? -eq 0 ]; then
        echo "[+] Port $port is OPEN"
    fi
done

echo
echo "Scan complete!"
