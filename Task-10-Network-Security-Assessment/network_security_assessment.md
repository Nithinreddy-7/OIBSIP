

# Network Security Assessment Report

**Internship:** Oasis Infobyte Cybersecurity Internship (OIBSIP)
**Task:** Task 10 – Network Security Assessment
**Assessment Type:** Network Reconnaissance and Traffic Analysis
**Assessment Date:** 30 June 2026

---

# Objective

The objective of this assessment was to evaluate the security posture of a controlled laboratory network by identifying active hosts, enumerating open ports and running services, capturing network traffic, analyzing potential security vulnerabilities, and recommending appropriate security improvements.

The assessment was conducted in an isolated virtual environment using Kali Linux as the assessment machine and Metasploitable 2 as the target system.

---

# Lab Environment

| Component        | Details                      |
| ---------------- | ---------------------------- |
| Attacker Machine | Kali Linux                   |
| Attacker IP      | 172.20.10.14                 |
| Target Machine   | Metasploitable 2             |
| Target IP        | 172.20.10.2                  |
| Network Type     | UTM Internal Virtual Network |
| Assessment Scope | Authorized Lab Environment   |

---

# Tools Used

* Nmap 7.99
* Wireshark
* Kali Linux
* Metasploitable 2

---

# Assessment Methodology

The assessment followed a standard network security assessment workflow.

1. Verified connectivity between Kali Linux and the target.
2. Performed service enumeration using Nmap.
3. Identified exposed ports and software versions.
4. Captured network traffic using Wireshark.
5. Generated Telnet traffic for packet analysis.
6. Analyzed captured packets.
7. Identified security weaknesses.
8. Documented findings and remediation recommendations.

---

# Nmap Scan

### Command Used

```bash
sudo nmap -sV -sC -T4 172.20.10.2 -oN nmap_results.txt
```

---

# Summary of Discovered Services

| Port | Service    | Version                   |
| ---- | ---------- | ------------------------- |
| 21   | FTP        | vsftpd 2.3.4              |
| 22   | SSH        | OpenSSH 4.7               |
| 23   | Telnet     | Linux telnetd             |
| 25   | SMTP       | Postfix                   |
| 53   | DNS        | ISC BIND 9.4.2            |
| 80   | HTTP       | Apache 2.2.8              |
| 111  | RPCBind    | Version 2                 |
| 139  | SMB        | Samba                     |
| 445  | SMB        | Samba 3.0.20              |
| 512  | rexecd     | Remote Execution          |
| 513  | rlogin     | Remote Login              |
| 514  | tcpwrapped | Remote Shell              |
| 1099 | Java RMI   | GNU Classpath             |
| 1524 | Bind Shell | Metasploitable Root Shell |
| 2049 | NFS        | Network File System       |
| 2121 | FTP        | ProFTPD 1.3.1             |
| 3306 | MySQL      | 5.0.51                    |
| 5432 | PostgreSQL | 8.3                       |
| 5900 | VNC        | Protocol 3.3              |
| 6000 | X11        | Access Denied             |
| 6667 | IRC        | UnrealIRCd 3.2.8.1        |
| 8009 | AJP13      | Apache JServ              |
| 8180 | HTTP       | Apache Tomcat 5.5         |

---

# Wireshark Traffic Analysis

Network traffic was captured while establishing a Telnet connection between Kali Linux and the Metasploitable 2 target.

The captured packets included:

* TCP Three-Way Handshake
* Telnet session establishment
* Interactive Telnet communication

### Evidence

Analysis of the captured TCP stream demonstrated that Telnet transmits communication without encryption.

The captured session revealed the transmitted administrative credentials:

```
Username: msfadmin
Password: msfadmin
```

Because Telnet does not encrypt network traffic, these credentials were visible in plaintext during packet analysis.

This demonstrates why Telnet is considered an insecure remote administration protocol and why it has been replaced by SSH in modern systems.

---

# Security Findings

---

## 1. Unauthenticated Root Bind Shell

### Evidence

Nmap identified a service named **Metasploitable Root Shell** listening on **Port 1524**.

### Risk

A root bind shell provides direct root-level system access over the network without normal authentication controls.

This represents a critical security weakness because unauthorized users could potentially obtain complete administrative control of the system.

### Recommendation

* Disable the bind shell immediately.
* Remove unauthorized startup scripts.
* Restrict unnecessary services using firewall rules.

---

## 2. Backdoored Service Versions

### Evidence

The assessment identified:

* vsftpd 2.3.4
* UnrealIRCd 3.2.8.1

Both versions are publicly documented as containing malicious backdoors and known security vulnerabilities.

### Risk

If deployed in a production environment, these software versions could allow attackers to execute remote code or compromise the affected host.

### Recommendation

* Remove vulnerable software.
* Upgrade to supported versions.
* Maintain regular patch management.

---

## 3. Anonymous FTP Login Enabled

### Evidence

Nmap reported:

```
Anonymous FTP login allowed
```

### Risk

Anonymous FTP allows users to access the server without authentication.

This may expose files or system information to unauthorized users.

### Recommendation

* Disable anonymous FTP.
* Replace FTP with SFTP or FTPS.

---

## 4. Telnet Service Enabled

### Evidence

Port 23 was open.

Wireshark analysis confirmed successful Telnet communication.

### Risk

Telnet transmits:

* Usernames
* Passwords
* Commands
* Session data

without encryption.

An attacker monitoring the network can intercept sensitive information.

### Recommendation

* Disable Telnet.
* Replace it with SSH.

---

## 5. Outdated Software Versions

Several services were running outdated software, including:

* Apache 2.2.8
* OpenSSH 4.7
* Samba 3.0.20
* PostgreSQL 8.3
* MySQL 5.0.51

### Risk

Older software versions may contain publicly known vulnerabilities that increase the likelihood of system compromise.

### Recommendation

Maintain regular software updates and security patching.

---

## 6. SMB Security Configuration

### Evidence

Nmap reported:

```
SMB Message Signing: Disabled
```

### Risk

Disabled SMB signing reduces protection against certain SMB-based network attacks.

### Recommendation

Enable SMB signing whenever operationally appropriate.

Restrict SMB access using firewall rules.

---

## 7. Large Attack Surface

### Evidence

The assessment discovered more than twenty network-accessible services.

### Risk

Every exposed service increases the overall attack surface and creates additional opportunities for attackers.

### Recommendation

* Disable unnecessary services.
* Restrict exposed ports.
* Apply the Principle of Least Privilege.
* Perform regular security assessments.

---

# Overall Risk Assessment

| Finding              | Risk     |
| -------------------- | -------- |
| Root Bind Shell      | Critical |
| Backdoored Services  | Critical |
| Anonymous FTP        | High     |
| Telnet               | High     |
| Outdated Software    | High     |
| SMB Configuration    | Medium   |
| Large Attack Surface | High     |

---

# Security Recommendations

The following security improvements are recommended:

* Remove legacy services such as Telnet.
* Replace FTP with secure alternatives.
* Upgrade all outdated software.
* Remove known backdoored software versions.
* Disable anonymous FTP access.
* Enable SMB signing where applicable.
* Close unnecessary network ports.
* Implement host-based firewall rules.
* Perform routine vulnerability assessments.
* Monitor network traffic for suspicious activity.
* Apply regular operating system and application security patches.

---

# Conclusion

A comprehensive network security assessment was successfully performed on the Metasploitable 2 laboratory environment using Nmap and Wireshark.

The assessment identified numerous exposed services, outdated software versions, insecure protocols, and intentionally vulnerable configurations. Packet analysis confirmed that Telnet transmitted authentication credentials in plaintext, demonstrating the risks associated with legacy remote administration protocols.

The results highlight the importance of minimizing the network attack surface, disabling insecure services, maintaining up-to-date software, implementing secure communication protocols, and conducting regular security assessments. Applying these recommendations would significantly improve the overall security posture of the system.

---

# Deliverables

* ✅ `network_security_assessment.md`
* ✅ `nmap_results.txt`
* ✅ `wireshark_capture.pcap`

