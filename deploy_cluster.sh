#!/bin/bash
# Micro-Cloud Deployment Script

echo "Launching 3-tier Ubuntu Cluster..."

# 1. Launch Containers
lxc launch ubuntu:22.04 web-server
lxc launch ubuntu:22.04 db-server
lxc launch ubuntu:22.04 load-balancer

# 2. Wait for IP assignment
sleep 5

# 3. Configure a 'Service' (Example: Installing Nginx on Web Server)
echo "Configuring Web Server..."
lxc exec web-server -- apt-get update && lxc exec web-server -- apt-get install nginx -y

# 4. Display Status
lxc list
