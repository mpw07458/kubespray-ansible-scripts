# kubespray-ansible-scripts
Ansible scripts to deploy multi-master HA kubernetes cluster with kubespray kubeadm

 Quickstart documentation

> Download kubernetes installer from code repository

change directory to working dir for example (~/working) and glone the github repository:

```
cd ~/working

git clone https://github.com/mpw07458/kubespray-ansible-scripts.git

cd kubespray-ansible-scripts

```

> Creating infrastructure for China AWS

```

cd contrib/terraform

cp -pR aws-cn aws

cd aws

```
ensure environemnt file "cn.env" is correct

cat cn.env
...

make AWS environment var are correct

run ansible playbook
...

```

creating Infrastructure for US AWS
----------------------------------

```

cd <repo name>

cp -pR us ../.

ensure environemnt file "us.env" is correct

cat us.env
...

make AWS environment var are correct

run ansible playbook

...

```
