#!/bin/bash
sudo -H python3.6 -m pip install --upgrade virtualenv
virtualenv -p python3 venv
./venv/bin/python -m pip install -r requirements.txt
./venv/bin/python -m pip install --upgrade boto3
cp -pR inventory/sample inventory/mycluster
cp -p contrib/aws_inventory/kubespray-aws-inventory.py inventory/mycluster/
source kube.env
./venv/bin/python inventory/mycluster/kubespray-aws-inventory.py --list
