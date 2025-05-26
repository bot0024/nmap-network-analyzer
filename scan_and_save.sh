#!/bin/bash
# scan_and_save.sh
# Basic script to scan your local network and save results

NETWORK="192.168.1.0/24"
TIMESTAMP=$(date +"%Y%m%d-%H%M%S")
OUTFILE="results/nmap_scan_$TIMESTAMP.txt"

mkdir -p results

echo "[*] Scanning $NETWORK..."
nmap -sS "$NETWORK" -oN "$OUTFILE"
echo "[+] Scan complete. Results saved to $OUTFILE"
