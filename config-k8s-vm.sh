sudo apt-get update
sudo sysctl net.ipv4.ip_forward
sudo sysctl -w net.ipv4.ip_forward=1
sudo ufw status
sudo ufw disable
sudo vi /etc/ssh/sshd_config
sudo passwd ubuntu
systemctl restart sshd
