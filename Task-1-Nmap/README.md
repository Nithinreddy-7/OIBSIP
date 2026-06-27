# Task 1 – Basic Network Scanning with Nmap

## Project Overview

This project demonstrates the use of Nmap (Network Mapper) to perform network reconnaissance in a controlled virtual lab environment. The objective was to identify active hosts, discover open TCP ports, detect running services, and understand the security implications of exposed services.

The assessment was conducted as part of the Oasis Infobyte Security Analyst Internship.

## Objective

- Perform a network scan using Nmap.
    
- Identify open TCP ports.
    
- Detect running services and software versions.
    
- Understand the security risks associated with exposed network services.
    
- Document findings in a professional manner.
    

## Lab Environment

|**Component**|**Details**|
|---|---|
|**Attacker Machine**|Kali Linux (ARM64 Virtualized)|
|**Target Machine**|Metasploitable 2 (Authorized Vulnerable VM)|
|**Network**|Shared Virtual Subnet (`172.20.10.0/28`)|
|**Tool Used**|Nmap 7.99|

## Execution Methodology

The assessment was performed in two operational phases to systematically profile the target asset.

### Phase 1 – Basic Scan

A rapid port discovery scan was executed to isolate active interfaces and determine open TCP boundaries on the target machine:

Bash

```
nmap --privileged 172.20.10.2 -oN results/basic_nmap_result.txt
```

The discovery layer successfully identified 23 open TCP ports spanning critical infrastructure protocols including FTP, SSH, Telnet, HTTP, SMB, MySQL, PostgreSQL, VNC, IRC, and Tomcat.

### Phase 2 – Advanced Scan

An advanced probe was executed utilizing service version detection and the Nmap Scripting Engine (NSE) to analyze underlying software configurations and flag active exposures:

Bash

```
nmap -sV -sC -T4 172.20.10.2 -oN results/nmap_scan_results.txt
```

This automated pipeline completed in **21.30 seconds** and extracted:

- Software version strings and protocol specifications.
    
- Operating System signatures (Unix/Linux kernel).
    
- Anonymous authentication parameters and banner records.
    
- Cryptographic cipher exposures and active backdoor shells.
    

## Threat Assessment & Port Significance Matrix

The advanced scan revealed an intensely exposed attack surface consisting of severely legacy and out-of-the-box configurations. Below is the security analysis of the key discovered interfaces:

|**Port / Protocol**|**Service Detected**|**Version / Banner Found**|**Security Significance & Vulnerability Context**|
|---|---|---|---|
|**21 / TCP**|FTP|`vsftpd 2.3.4`|**Critical Risk:** This specific application version contains an infamous malicious backdoor (CVE-2011-2523) enabling unauthenticated command execution. NSE scripts also verified that public anonymous logins are actively permitted.|
|**22 / TCP**|SSH|`OpenSSH 4.7p1`|**Medium Risk:** Outdated release susceptible to user enumeration flaws. If loose password policies are active, it serves as a primary vector for automated brute-force attacks.|
|**23 / TCP**|Telnet|`Linux telnetd`|**Critical Risk:** Telnet handles data exchange in unencrypted plaintext. Authentication credentials and raw command data can be easily intercepted in transit over the wire.|
|**80 / TCP**|HTTP|`Apache httpd 2.2.8`|**High Risk:** The web server runs legacy modules and hosts insecure deployment interfaces, exposing the application layer to cross-site scripting and server-side logic bypasses.|
|**139, 445 / TCP**|SMB|`Samba smbd 3.0.20`|**Critical Risk:** The active Samba daemon is highly vulnerable to remote code execution bugs. Default security scripts confirmed that message signing is disabled, allowing unauthorized information harvest.|
|**1524 / TCP**|Bindshell|`Metasploitable root shell`|**Critical Risk:** A literal pre-spawned root command shell running completely unauthenticated. Attackers can bind directly to this socket using raw netcat utilities to seize complete administrative control.|
|**3306 / TCP**|MySQL|`MySQL 5.0.51a`|**High Risk:** The database engine is directly bound to an external-facing interface. This exposes structural schemas to network sniffing and raw authentication bypass attempts.|
|**6667 / TCP**|IRC|`UnrealIRCd 3.2.8.1`|**Critical Risk:** This engine contains a known trojan horse backdoor allowing attackers to pass malicious arguments directly to the host's operating system shell.|

## Security Analysis

Although Metasploitable 2 is intentionally configured with vulnerabilities for educational and laboratory testing, the gathered data illustrates foundational structural exposures that create massive liability frameworks in an enterprise production environment.

Key architectural concerns identified include:

- **Legacy Software Lifecycles:** Running heavily outdated application layers that have long passed their end-of-life cycle and lack modern patch support.
    
- **Protocols Lacking Cryptographic Controls:** Relying on basic plaintext communication protocols (such as Telnet and FTP) which fail to safeguard data confidentiality or integrity.
    
- **Deficient Access Controls:** Allowing anonymous file navigation access and running unauthenticated administrative bind shells openly over network zones.
    
- **Inflated Attack Surface:** Leaving non-essential ports, protocol environments, and database daemons completely accessible to the external network boundary.
    

## Recommendations

To harden the infrastructure and address the security flaws surfaced during reconnaissance, the following defense-in-depth remediations should be prioritized:

1. **Enforce Service Minimization:** Deactivate or completely uninstall all non-essential applications, legacy daemons, and administrative backdoors (e.g., ports 1524 and 6667).
    
2. **Migrate to Secure Communication Standards:** Terminate cleartext transmission pathways like Telnet and implement secure, encrypted cryptographic alternatives such as OpenSSH.
    
3. **Deactivate Anonymous Authentication:** Reconfigure the FTP daemon settings to strictly forbid unauthenticated user access, forcing explicit permission criteria for all sessions.
    
4. **Deploy Network-Level Firewalls:** Restrict exposure by implementing restrictive host-based or network-level firewall topologies (like UFW or iptables) to isolate database engines and administrative interfaces from external vectors.
    
5. **Establish Lifecycle Patch Management:** Implement a systematic upgrade cadence to ensure underlying operating systems and service versions are actively patched against known public exploits.
    

## Skills Demonstrated

- Network Reconnaissance & Mapping
    
- Advanced Port Scanning Mechanics
    
- Passive and Active Service Enumeration
    
- Vulnerability and Risk Analysis
    
- Professional Security Reporting & Technical Writing
    
- Linux Command-Line Proficiency
    
- Network Security Fundamentals
    

## Conclusion

This project provided hands-on experience with one of the most widely used network reconnaissance tools in cybersecurity. The assessment highlighted how attackers and defenders use Nmap to identify exposed services and evaluate the security posture of a system.

The knowledge gained from this exercise forms the foundation for more advanced penetration testing and security assessment activities.
