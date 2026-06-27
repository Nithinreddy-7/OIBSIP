# Task 4 – Research Report on Common Network Security Threats

## 📌 Overview

This repository contains the deliverable for **Task 4** of the Cybersecurity Internship: a research report covering common network security threats — **Denial of Service (DoS/DDoS)**, **Man-in-the-Middle (MITM)**, and **Spoofing** attacks — including how each works, real-world incidents, impact, and mitigation strategies.

## 🎯 Objective

Research and explain common network security threats, describe how each one works, its impact, and how to mitigate it, and back the analysis with real-world attack examples and preventive measures.

## 📂 Repository Structure

```
.
├── network_security_threats_report.md   # Detailed research report (main deliverable)
└── README.md                            # This file
```

## 📋 Task Steps Completed

- [x] Researched and explained common network security threats
- [x] Described how each threat works, its impact, and mitigation strategies
- [x] Included real-world examples of attacks with preventive measures
- [x] Compiled findings into a single, well-structured markdown report

## 📑 Deliverable

**[`network_security_threats_report.md`](./network_security_threats_report.md)** — a structured research report covering:

| Section | Contents |
|---|---|
| DoS / DDoS Attacks | Attack categories (volumetric, protocol, application-layer), attacker workflow, real-world cases (Mirai → Dyn 2016, Memcached → GitHub 2018), detection & mitigation |
| Man-in-the-Middle (MITM) | ARP/DNS spoofing, rogue Wi-Fi, SSL stripping, BGP hijacking, rogue certificates; real-world case (DigiNotar CA compromise, 2011); detection & mitigation |
| Spoofing Attacks | IP, MAC, ARP, DNS, email, and domain spoofing; real-world case (MyEtherWallet BGP/DNS hijack, 2018); current BEC fraud statistics (FBI IC3 2024); detection & mitigation |
| Comparative Analysis | Side-by-side breakdown of all three threats across goals, CIA impact, and primary defenses |
| Defense-in-Depth | Consolidated best-practices checklist (segmentation, MFA, encryption, ingress filtering, SIEM, Zero Trust, etc.) |

The report includes **Mermaid diagrams** (render natively in GitHub's markdown viewer) illustrating the DDoS botnet flow, the MITM interception sequence, and ARP/IP spoofing mechanics, alongside quick-revision tables for each threat category.

## 🔍 Key Highlights

- Attacker-and-defender perspective for every threat (how it's exploited *and* how it's detected/stopped)
- Verified real-world incidents with sourced facts, not generic textbook summaries
- Comparative table showing how spoofing acts as the *enabling technique* behind both DDoS amplification and MITM attacks

## ▶️ How to View

Open `network_security_threats_report.md` directly on GitHub — diagrams, tables, and alert callouts are all rendered natively in GitHub's markdown viewer, no additional setup required.

## 🎥 Demo Video

Not required for this task.

## 👤 Author

**Emmadi Nithin Reddy**
B.Tech CSE (IoT, Cyber Security & Blockchain) — CBIT Hyderabad
Cybersecurity Intern @ Oasis Infobyte

## 📜 Disclaimer

This report is prepared strictly for educational and academic purposes as part of an internship task. No exploit code, attack scripts, or offensive tooling is included — only conceptual explanations, public case studies, and defensive guidance.