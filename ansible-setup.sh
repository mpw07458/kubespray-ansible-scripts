#!/bin/bash
sudo apt-get update -y
sudo apt-get install software-properties-common -y
sudo apt-add-repository ppa:ansible/ansible -y
sudo apt-get update -y
sudo apt-get install ansible -y
ansible —version
sudo apt-get install build-essential checkinstall -y
sudo apt-get install libreadline-gplv2-dev libncursesw5-dev libssl-dev \
    libsqlite3-dev tk-dev libgdbm-dev libc6-dev libbz2-dev -y
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
git clone https://github.com/kubernetes-incubator/kubespray.git
cp kube.env kubespray/.
cp kubespray-install-k8s.sh kubespray/.
chmod +x kubespray/kubespray-install-k8s.sh
