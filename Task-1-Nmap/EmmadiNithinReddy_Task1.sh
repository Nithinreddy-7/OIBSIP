#!/bin/bash

# Basic Scan
nmap --privileged 172.20.10.2 -oN results/basic_nmap_result.txt

# Advanced Scan
nmap -sV -sC -T4 172.20.10.2 -oN results/advanced_nmap_scan.txt