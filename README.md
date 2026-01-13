**Section 1: Architecture Overview:**  

"I built a localized micro-cloud using LXD to manage LXC containers on an Ubuntu 24.04 host. The goal was to simulate a production environment to practice Kernel log analysis and Network optimization."  
<img width="729" height="175" alt="image" src="https://github.com/user-attachments/assets/d57c8f92-600f-4ec5-886d-033f47139046" />  
***  
**Section 2: Engineering Choices:**  

Storage: Why I chose dir is because this was purely for testing and non-production demonstration, as zfs was not available, it would have been more efficient and faster.  
Networking: Implementing a managed Bridge (lxdbr0) with custom DHCP ranges.  
***    
**Section 3: Incident Report:**  

Case ID: 001 - "Web-Server Connectivity Degradation"  
  
Symptom: Web-server container unable to reach external repositories.  
  
Diagnostic Steps:  
1. Checked `lxc info web-server` to verify IP assignment.  
2. Ran `lxc monitor` to watch system-level events.  
3. Used `journalctl -xe` on the host to check for bridge errors.  
  
Resolution: Identified a mismatch in MTU settings between the container and the physical gateway. Restored MTU to 1500 using `tcpdump`; connectivity restored.  
***  
THE END!
