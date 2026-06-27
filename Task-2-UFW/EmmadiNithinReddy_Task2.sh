#!/bin/bash

echo "Starting UFW Firewall Configuration..."

sudo ufw --force reset

sudo ufw default deny incoming

sudo ufw default allow outgoing

sudo ufw allow ssh

sudo ufw deny 80/tcp

sudo ufw enable

echo "Firewall Status"

sudo ufw status verbose

echo "Firewall Rules"

sudo ufw status numbered

echo "Configuration Completed Successfully."