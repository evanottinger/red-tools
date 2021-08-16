#!/bin/bash/

# Description: A script to install tools for penetration testing
# on Debian-based Linux distributions. 
#
# Author: Evan Ottinger -- @OttySec

# Update Installed packages
apt update && upgrade -y

# Install Dependencies
apt install git gcc make libpcap-dev

# Subdomain Enumeration Tools
## Install Sublist3r
echo "[>] Installing Sublist3r. . ."
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

# Port Scanners and Network Enumeration Tools
## Install Masscan
echo "[>] Install Masscan. . ."
git clone https://github.com/robertdavidgraham/masscan.git /opt/masscan
cd /opt/masscan
make -j
cd ~
echo ["[+] Masscan installed!"]

# Web Tools
## Install Httprint
echo "[>] Installing httprint. . ."
wget https://www.net-square.com/_assets/httprint_linux_301.zip

checksum = $(md5sum httprint_linux_301.zip | cut -d " " -f 1)

[[ $checksum -eq "af53704de9c1851bd439cbe3fab3e0ad" &&
   $(unzip httprint_linux_301.zip -d /opt/httprint/) &&
   $(ln -s /opt/httprint_301/linux/httprint /usr/local/sbin/httprint) &&
   $(echo "Httprint installed!") ]]
