#!/bin/bash
git clone https://github.com/kubernetes-incubator/kubespray.git
cd kubespray
sudo python3 -m pip install -r requirements.txt
python3.6 -m pip install --upgrade virtualenv
virtualenv -p python3 venv
cp -pR inventory/sample inventory/mycluster
cp -p contrib/aws_inventory/kubespray-aws-inventory.py inventory/mycluster/
export PYTHONUSERBASE=$HOME
export CURRENTDIR=`pwd`
source $CURRENTDIR/venv/bin/activate
export PYTHONPATH=$CURRENTDIR/venv/bin
pip install --upgrade boto3
# uncomment the cloud_provider option in group_vars/all.yml and set it to 'aws'
# Changing the network as per your liking in “inventory/mycluster/group_vars/k8s-cluster/k8s-cluster.yml”
# add kube_network_plugin: calico
# Changing "inventory/mycluster/group_vars/all/all.yml” 
# kube_read_only_port: 10255
export VPC_VISIBILITY="public"
export REGION="us-east-1"
