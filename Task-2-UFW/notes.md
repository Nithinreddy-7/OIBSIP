# Task 2 Notes

## What is UFW?

UFW (Uncomplicated Firewall) is a user-friendly interface for managing Linux firewall rules.

It simplifies firewall management by providing easy-to-use commands while internally configuring iptables or nftables.

---

## Why Firewalls Matter

A firewall protects a computer by filtering incoming and outgoing network traffic.

Benefits include:

- Prevent unauthorized access
- Reduce attack surface
- Block unnecessary services
- Improve system security

---

## Principle of Least Privilege

The firewall should only allow the services that are absolutely necessary.

Everything else should remain blocked.

---

## Rules Configured

Allowed

- SSH (22/TCP)

Blocked

- HTTP (80/TCP)

---

## Commands Learned

Check firewall

```bash
sudo ufw status
```

Reset firewall

```bash
sudo ufw --force reset
```

Default policy

```bash
sudo ufw default deny incoming
sudo ufw default allow outgoing
```

Allow SSH

```bash
sudo ufw allow ssh
```

Block HTTP

```bash
sudo ufw deny 80/tcp
```

Enable firewall

```bash
sudo ufw enable
```

View rules

```bash
sudo ufw status verbose

sudo ufw status numbered
```

---

## Lessons Learned

- Configure secure default policies.
- Allow only necessary services.
- Verify firewall rules after configuration.
- Document security changes for future reference.