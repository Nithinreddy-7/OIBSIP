# 🛡️ Oasis Infobyte Security Analyst Internship Portfolio

Welcome to my Security Engineering Portfolio. 

This repository contains the practical deliverables and automated workflows developed during my tenure as a Security Analyst Intern at Oasis Infobyte (June - July 2026). 

Rather than isolated assignments, this repository is architected as a **Full-Lifecycle Penetration Test and Remediation Simulation**. It demonstrates a complete progression from offensive network reconnaissance to defensive firewall implementation, culminating in an enterprise-grade security assessment.

---

## 👨‍💻 Security Analyst 
**Emmadi Nithin Reddy** *Computer Science & Engineering* Specializations: Cybersecurity Architecture | IoT Security | Blockchain Integrity

---

## 🛠️ Technical Stack & Lab Architecture

| Category | Technologies & Tooling |
| :--- | :--- |
| **Offensive (Red)** | Kali Linux, Nmap, Metasploit Framework |
| **Defensive (Blue)** | UFW (Uncomplicated Firewall), Linux iptables |
| **Analysis** | Wireshark, Protocol Dissection, PCAP Analysis |
| **Target Assets** | Metasploitable 2 (Isolated Virtualized Subnet) |

---

## 📂 Assessment Lifecycle & Status

| Phase | Module | Objective | Status |
| :---: | :--- | :--- | :---: |
| **01** | [Task 1: Basic Network Scanning with Nmap](./Task-1-Nmap) | Automated footprinting and vulnerability profiling of a target asset. | ✅ **Completed** |
| **02** | [Task 2: Firewall Configuration using UFW](./Task-2-UFW) | Implementing zero-trust ACLs to secure discovered vulnerabilities. | ✅ **Completed**|
| **03** | [Task 4: Network Security Threats Report](./Task-4) | Research Report on Common Network Security Threats | ✅ **Completed**|
| **04** | [Task 5: Report on Social Engineering Attacks ](./Task-5) |Detailed report on social engineering attacks such as phishing, pretexting, and baiting.| ✅ **Completed**|
| **05** | [Task 5: Report on the Importance of Patch Management](./Task-6) | report explaining the significance of patch management in cybersecurity. | ✅ **Completed**|
| **06** | [Task 8: Network Traffic Analysis](./Task-8-Wireshark) | Sniffing cleartext protocols and analyzing packet captures. | ✅ **Completed** |
| **07** | [Task 10: Network Security Assessment Report](./Task-10-Network-Security-Assessment) | Aggregating raw telemetry into an executive threat matrix. | ⏳ *Pending* |

---

## 📚 Core Competencies Demonstrated

* **Network Reconnaissance:** Automated service enumeration and OS fingerprinting.
* **Access Control:** Building and deploying hardened Linux firewall architectures.
* **Packet Analysis:** Deep-level packet dissection and cleartext credential extraction.
* **Technical Writing:** Translating raw terminal data into actionable SOC documentation.

---

## 🌳 Repository Architecture

```text
OIBSIP/
├── Task-1-Nmap/
│   ├── results/
│   │   ├── advanced_nmap_scan.txt
│   │   └── basic_nmap_result.txt
│   ├── screenshots/
│   │   ├── 01_basic_nmap_scan.png
│   │   ├── 02_advance-nmap-scan.png
│   │   ├── 03_advance_scan.png
│   │   └── 04_advance_scan.png
│   ├── EmmadiNithinReddy_Task1.sh
│   ├── README.md
│   └── notes.md
├── Task-2-UFW/
│   ├── screenshots/
│   │   ├── ss1_ufw.png
│   │   ├── ss2_ufw.png
│   │   └── ufw_output.png
│   ├── EmmadiNithinReddy_Task2.sh
│   ├── README.md
│   ├── notes.md
│   └── ufw_status.txt
├── Task-4-Network-Security-Threats/
│   ├── README.md
│   └── network_security_threats_report.md
├── Task-5-Research Report on Social.../
│   ├── README.md
│   └── social_engineering_report.md
├── Task-6- Research Report on the I.../
│   └── patch_management_report.md
├── Task-8-Wireshark/
│   ├── screenshots/
│   │   ├── capture.png
│   │   ├── http-filter.png
│   │   └── packet-analysis.png
│   ├── EmmadiNithinReddy_Task8.pcap
│   ├── README.md
│   └── analysis.md
├── Task-10-Network-Security-Assessment/
│   ├── network_security_assessment.md
│   ├── nmap_scan_results.txt
│   └── wireshark_capture.pcap
├── .gitignore
├── LICENSE
└── README.md