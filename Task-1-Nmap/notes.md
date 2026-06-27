# Task 1 Notes

## Concepts Learned

### What is Nmap?

Nmap (Network Mapper) is an open-source network scanning tool used to discover hosts, identify open ports, detect services, and gather information about networked systems.

---

## Why Port Scanning Matters

Open ports represent entry points into a system. Each open port usually corresponds to a running service.

Understanding exposed services helps security professionals:

* Discover unnecessary services
* Reduce attack surface
* Identify outdated software
* Verify firewall configurations

---

## Common Services Identified

| Port | Service       | Purpose                |
| ---- | ------------- | ---------------------- |
| 21   | FTP           | File Transfer          |
| 22   | SSH           | Secure Remote Login    |
| 23   | Telnet        | Remote Login           |
| 25   | SMTP          | Mail Transfer          |
| 53   | DNS           | Domain Name Resolution |
| 80   | HTTP          | Web Server             |
| 139  | NetBIOS       | Windows File Sharing   |
| 445  | SMB           | File Sharing           |
| 3306 | MySQL         | Database               |
| 5432 | PostgreSQL    | Database               |
| 5900 | VNC           | Remote Desktop         |
| 8180 | Apache Tomcat | Web Application Server |

---

## Personal Observations

The target machine intentionally exposes numerous services for educational purposes. Running both a basic and an advanced scan demonstrated how additional Nmap options provide deeper visibility into running software and potential security weaknesses.

The advanced scan provided service versions and default NSE script output, making it significantly more useful during a security assessment.

---

## Lessons Learned

* Network reconnaissance is the first phase of penetration testing.
* Different Nmap scan options reveal different levels of information.
* Service version detection helps identify outdated software.
* Documentation is just as important as technical execution.
* Scanning should only be performed on systems you own or have permission to assess.
