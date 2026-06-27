# Task 2 – Defensive Firewall Architecture (UFW)

## 📌 Project Overview
This module demonstrates the manual deployment and configuration of a host-based firewall utilizing UFW (Uncomplicated Firewall) on an Ubuntu Linux endpoint. 

The objective was to harden the operating system by enforcing the Principle of Least Privilege (PoLP)—establishing a strict default-deny baseline for inbound traffic while explicitly allowing only mission-critical administrative services.

This defensive assessment was completed as part of the Oasis Infobyte Security Analyst Internship.

---

## 🔬 Lab Environment & Scope
| Component | Architecture Details |
| :--- | :--- |
| **Operating System** | Ubuntu 22.04 LTS (ARM64) |
| **Firewall Engine** | UFW (Uncomplicated Firewall) / iptables |
| **Hypervisor** | UTM Virtualization |
| **Deployment Method** | Manual CLI Execution |

---

## 🛡️ Access Control Lists (ACLs) & Policies
To ensure a secure baseline, all implicit routing was restricted.

**Global Default Policies:**
* **Incoming Traffic:** `DENY` (Drops all unsolicited external connection attempts).
* **Outgoing Traffic:** `ALLOW` (Permits standard outbound communication).

**Explicit Port Rules:**
| Port | Protocol | Action | Security Context & Purpose |
| :--- | :--- | :--- | :--- |
| **22** | TCP | **ALLOW IN** | **Secure Shell (SSH):** Required for secure, encrypted remote administration. |
| **80** | TCP | **DENY IN** | **HTTP:** Explicitly blocked to prevent unauthorized access to unencrypted web traffic, as no web daemons are required on this endpoint. |

*(Note: IPv6 equivalent rules were automatically generated and applied alongside IPv4 rules).*

---

## ⚙️ Execution Methodology
The firewall was deployed manually via the command-line interface to ensure granular control over rule creation, policy enforcement, and verification.

```bash
# 1. Reset existing firewall states
sudo ufw --force reset

# 2. Establish Zero-Trust default policies
sudo ufw default deny incoming
sudo ufw default allow outgoing

# 3. Apply explicit Access Control Lists
sudo ufw allow ssh
sudo ufw deny 80/tcp

# 4. Activate the firewall engine
sudo ufw enable

# 5. Verify the active ruleset
sudo ufw status verbose
sudo ufw status numbered