#!/bin/bash/

# Description: A script to install tools for penetration testing
# on Debian-based Linux distributions. 
#
# Author: Evan Ottinger -- @OttySec

# Update Database
apt update

# Subdomain Enumeration Tools
## Install Sublist3r
echo "[>] Instaling Sublist3r. . ."
git clone https://github.com/aboul3la/Sublist3r.git /opt/Sublist3r
sudo pip -r install /opt/Sublist3r/requirements.txt
ln -s /opt/Sublist3r/sublist3r.py $(echo $PATH | cut -d ":" -f 1)
echo "[+] Sublist3r installed!"

## Install amass
### dependent upon snap package manager
echo "[>] Installing amass. . ."
apt install snapd
service snapd start
snap install amass
echo ["[+] amass installed!"]