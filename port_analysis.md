### 🔍 Common Services and Security Risk Analysis

| **Port** | **Protocol** | **Service Name**  | **Description** | **Potential Security Risks** | **Mitigation Strategies** |
|----------|--------------|-------------------|-----------------|------------------------------|----------------------------|
| 135      | TCP          | MSRPC             | Microsoft Remote Procedure Call used for Windows services. | Remote code execution, malware like Blaster | Block externally, harden RPC |
| 139      | TCP          | NetBIOS-SSN       | File sharing on older Windows systems | Null session attacks, info leakage | Disable NetBIOS, firewall rules |
| 445      | TCP          | Microsoft-DS      | SMB over TCP (file sharing) | EternalBlue exploit, SMB relay attacks | Disable SMBv1, patch OS |
| 902      | TCP          | VMware ESX        | VMware remote management | Unauthorized access to hypervisors | Restrict to internal IPs, use VPN |
| 3306     | TCP          | MySQL             | Database service | Brute-force, SQL injection | Strong passwords, TLS, access control |
