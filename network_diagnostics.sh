#!/bin/bash

# Function to check host availability (ping)
check_ping() {
    echo "Checking host availability..."
    for host in "${HOSTS[@]}"; do
        echo "Pinging $host..."
        ping -c 4 $host &>/dev/null
        if [[ $? -eq 0 ]]; then
            echo "[OK] $host is reachable"
        else
            echo "[ERROR] $host is unreachable!"
        fi
    done
}

# Function to check network speed (ping)
check_speed() {
    echo "Checking network speed..."
    for host in "${HOSTS[@]}"; do
        echo "Testing speed to $host..."
        ping -c 10 $host | tail -n 10
    done
}

# Function to check DNS resolution
check_dns() {
    echo "Checking DNS resolution..."
    for domain in "${DOMAINS[@]}"; do
        echo "Resolving $domain..."
        nslookup $domain &>/dev/null
        if [[ $? -eq 0 ]]; then
            echo "[OK] DNS resolution for $domain succeeded"
        else
            echo "[ERROR] DNS resolution for $domain failed"
        fi
    done
}

# Function to check open ports
check_ports() {
    echo "Checking open ports..."
    for ip in "${IPS[@]}"; do
        for port in "${PORTS[@]}"; do
            echo "Checking port $port on $ip..."
            nc -zv -w 5 $ip $port &>/dev/null
            if [[ $? -eq 0 ]]; then
                echo "[OK] Port $port on $ip is open"
            else
                echo "[ERROR] Port $port on $ip is closed"
            fi
        done
    done
}

# List of hosts to ping and test availability
HOSTS=(
    "8.8.8.8"
    "google.com"
)

# List of domains for DNS resolution testing
DOMAINS=(
    "google.com"
    "github.com"
)

# List of IP addresses and ports to check for open ports
IPS=(
    "192.168.1.1"
    "8.8.8.8"
)

PORTS=(
    "22"
    "80"
    "443"
)

# Main function to run all diagnostics
run_diagnostics() {
    echo "Starting network diagnostics..."
    check_ping
    check_speed
    check_dns
    check_ports
    echo "Network diagnostics completed."
}

# Run the diagnostics
run_diagnostics
