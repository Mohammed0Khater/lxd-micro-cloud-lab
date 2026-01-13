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



git clone [https://github.com/Mohammed0Khater/lxd-micro-cloud-lab.git](https://github.com/Mohammed0Khater/lxd-micro-cloud-lab.git)
cd lxd-micro-cloud-lab
chmod +x deploy_cluster.sh
./deploy_cluster.sh
