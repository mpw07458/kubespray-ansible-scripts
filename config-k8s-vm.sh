#!/bin/bash
sudo add-apt-repository ppa:deadsnakes/ppa -y
sudo apt-get update -y
sudo apt-get install python -y
sudo apt-get install python-pip -y
pip install -upgrade pip
pip install jinja2
sudo apt-get install python3.6 -y
sudo apt-get install python3-pip -y
pip3 install --upgrade pip
pip3 install jinja2
sudo apt-get install python-netaddr -y
sudo sysctl net.ipv4.ip_forward
sudo sysctl -w net.ipv4.ip_forward=1
sudo ufw status
sudo ufw disable
sudo vi /etc/ssh/sshd_config
sudo passwd ubuntu
systemctl restart sshd
