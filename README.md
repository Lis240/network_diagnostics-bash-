# 🛠 Network Diagnostics Script (Bash)

A simple network diagnostic tool written in Bash that performs multiple tests to help identify potential issues in your network. The script performs ping tests, checks for DNS resolution problems, verifies open ports, and measures network speed.

## 🚀 Features

- **Ping test**: Checks if hosts are reachable and measures latency.
- **Network speed**: Measures network latency to multiple hosts.
- **DNS resolution**: Verifies DNS resolution for a list of domains.
- **Port availability**: Checks if specific ports are open on remote IPs.

## ⚙️ How It Works

The script runs the following tests:

1. **Ping test**: Checks if the remote hosts are reachable via ICMP (ping).
2. **Network speed**: Measures network speed to remote hosts by pinging and displaying latency statistics.
3. **DNS resolution**: Verifies that DNS resolution works for a list of domains.
4. **Port availability**: Uses `nc` (netcat) to check if specific ports are open on remote servers.

## 🧪 Usage

1. Clone the repository:

```bash
git clone https://github.com/Lis240//network_diagnostics_bash.git
cd network-diagnostics
chmod +x network_diagnostics.sh
Edit network_diagnostics.sh to configure the hosts, domains, IPs, and ports you want to monitor.
For example:
HOSTS=("8.8.8.8" "google.com")
DOMAINS=("google.com" "github.com")
IPS=("192.168.1.1" "8.8.8.8")
PORTS=("22" "80" "443")
./network_diagnostics.sh
