# 🚀 Ubuntu Micro-Cloud: Automated Container Orchestration & Troubleshooting Lab

![Ubuntu](https://img.shields.io/badge/Ubuntu-E95420?style=for-the-badge&logo=ubuntu&logoColor=white)
![LXD](https://img.shields.io/badge/LXD-00599C?style=for-the-badge&logo=linuxcontainers&logoColor=white)
![Bash](https://img.shields.io/badge/Bash-4EAA25?style=for-the-badge&logo=gnu-bash&logoColor=white)

## 📌 Project Overview
This project is a localized, high-availability micro-cloud environment built on **Ubuntu** using **LXD**. It serves as a technical sandbox for automated container orchestration, software-defined networking, and Linux system troubleshooting.

This lab leverages **LXC (Linux Containers)** to simulate a 3-tier enterprise architecture (Load Balancer, Web Server, Database) on a single Ubuntu host, focusing on the core technologies supported by Canonical.

---

## 🏗 Architecture
The lab deploys a 3-node cluster within a managed **Linux Bridge (`lxdbr0`)**:

| Node Name | Role | OS | Tech Stack |
| :--- | :--- | :--- | :--- |
| `load-balancer` | Traffic Management | Ubuntu 24.04 | Nginx / HAProxy |
| `web-server` | Application Tier | Ubuntu 24.04 | Nginx / Python |
| `db-server` | Data Tier | Ubuntu 24.04 | MySQL / SQLite |

---

## 🛠 Technical Skills Demonstrated
* **Virtualization & Containers:** Advanced management of LXD/LXC instances.
* **Networking:** Software Defined Networking (SDN), bridge configuration, and MTU optimization.
* **Storage:** Management of ZFS/Btrfs storage pools within Linux.
* **Automation:** End-to-end lifecycle automation using Bash scripting.
* **Observability:** Log analysis via `journalctl`, `lxc monitor`, and `tcpdump`.

---

## 🚀 Getting Started

### 1. Prerequisites
Ensure LXD is installed and initialized on your Ubuntu host:
```bash
sudo snap install lxd
sudo lxd init --auto
```

---
### 2. Deployment

```
git clone [https://github.com/Mohammed0Khater/lxd-micro-cloud-lab.git](https://github.com/Mohammed0Khater/lxd-micro-cloud-lab.git)
cd lxd-micro-cloud-lab
chmod +x deploy_cluster.sh
./deploy_cluster.sh
```
---

## 🔍 Troubleshooting Log (Root Cause Analysis)

Documented case studies of simulated environment failures.

### **Incident #001: Fragmented Packet Drop (MTU Mismatch)**

Symptom: `web-server` container could `ping` external IPs but failed to complete `apt-get update` (TCP handshake hung).

Diagnostic Steps:

1. Ran `tcpdump -i lxdbr0` on the host to inspect traffic.

2. Observed "ICMP Destination Unreachable (Fragmentation Needed)" packets.

3. Verified container `eth0` MTU (1500) exceeded the tunnel overhead of the host bridge.

Resolution: Adjusted the LXD bridge MTU to 1450 to accommodate encapsulation overhead. Root Cause: Path MTU Discovery (PMTUD) failure in a nested virtual environment.

### **Incident 002: Service Start Failure (Systemd Triage)**

Symptom: Nginx failed to start on the `load-balancer` node after configuration changes.

Diagnostic Steps:

1. Executed `lxc exec load-balancer -- systemctl status nginx`.

2. Analyzed `journalctl -u nginx` inside the container.

3. Found a syntax error in `/etc/nginx/sites-enabled/default` regarding an invalid port binding.

Resolution: Corrected the configuration file and validated with `nginx -t`.

---

## 📊 Maintenance & Cleanup  

To reset the lab environment and delete all nodes to free up resources:

```
lxc delete load-balancer web-server db-server --force
```
## 🎯 Canonical Support Alignment  

This project specifically targets the skills requested in the Cloud Support Engineer job description:

* LXD/LXC: Extensive hands-on usage of Canonical's container manager.

* Networking: Bridge management, MTU tuning, and TCP/IP triage.

* Troubleshooting: Advanced log navigation using journalctl and stack trace analysis.

* Programming: Automation via Bash scripting.








