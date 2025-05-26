# 🔍 Network Port Scanning and Analysis Guide

This guide walks you through the process of scanning your local network to identify open ports, discover services, and evaluate potential security risks.

---

## 🛠️ Prerequisites

- [Nmap](https://nmap.org/download.html)
- (Optional) [Wireshark](https://www.wireshark.org/download.html)

---

## 🚀 Steps to Perform Network Scan

### 1. Install Nmap
Download and install Nmap from the official website:  
👉 [https://nmap.org/download.html](https://nmap.org/download.html)

---

### 2. Find Your Local IP Range
You can find your local IP and subnet using:

#### On Linux/macOS:

```bash
ip a 
```

#### On Windows:
```
ipconfig
```
Example IP range: 192.168.1.0/24

### 3. Run a TCP SYN Scan
```
nmap -sS 192.168.1.0/24
```
This performs a stealthy scan to detect live hosts and open TCP ports.

### 4. Record Findings
Note down:

IP addresses of active hosts

Open ports and services detected

### 5. (Optional) Use Wireshark for Packet Capture
Start a capture in Wireshark to analyze how devices respond to the scan.

### 6. Research Common Services
| **Port** | **Protocol** | **Service Name** | **Description**                                                  |
| -------- | ------------ | ---------------- | ---------------------------------------------------------------- |
| 135      | TCP          | MSRPC            | Microsoft Remote Procedure Call — used for DCOM services.        |
| 139      | TCP          | NetBIOS-SSN      | NetBIOS Session Service — used for Windows file/printer sharing. |
| 445      | TCP          | Microsoft-DS     | Direct SMB over TCP — commonly used for file sharing in Windows. |
| 902      | TCP          | VMware ESX       | VMware remote management (used by ESXi hosts).                   |
| 3306     | TCP          | MySQL            | MySQL database service — used for managing SQL databases.        |


### 🔐 7. Analyze Security Risks
| **Port** | **Risks**                                                                                    | **Mitigation**                                                                            |
| -------- | -------------------------------------------------------------------------------------------- | ----------------------------------------------------------------------------------------- |
| **135**  | - Targeted by malware like **Blaster**.<br>- Used in **remote code execution** attacks.      | - Block externally.<br>- Allow only on internal segments.<br>- Harden RPC settings.       |
| **139**  | - **Null session** vulnerabilities.<br>- Leakage of usernames/shares.                        | - Disable NetBIOS.<br>- Use strong firewall rules.<br>- Use SMBv2/v3 only.                |
| **445**  | - Vulnerable to **EternalBlue** (WannaCry, NotPetya).<br>- **SMB relay** attacks.            | - Disable SMBv1.<br>- Patch system.<br>- Block port externally.                           |
| **902**  | - Could be used to **access VMware services remotely**.<br>- Potential **ESXi enumeration**. | - Restrict to management networks.<br>- Use VPN + firewall.<br>- Update VMware software.  |
| **3306** | - MySQL **brute-force** attacks.<br>- Risk of **SQL injection** if exposed to public.        | - Don’t expose publicly.<br>- Use strong credentials.<br>- Enable SSL and access control. |


### 8. Save Scan Results
As a text file:
```bash
nmap -sS 192.168.1.0/24 -oN scan_results.txt
```

As HTML:
```bash
nmap -sS 192.168.1.0/24 -oX scan_results.xml
xsltproc scan_results.xml -o scan_results.html
```
