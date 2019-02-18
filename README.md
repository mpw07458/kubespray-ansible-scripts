# kubespray-ansible-scripts
Ansible scripts to deploy multi-master HA kubernetes cluster with kubespray kubeadm

 Quickstart documentation

>download installer from code repository
---------------------------------------

```
change directory to working dir for example cd ~/working

git clone <repo name> 

```

>creating infrastructure for China AWS
--------------------------------------

```

cd <repo name>

cp -pR us ../.

ensure environemnt file "cn.env" is correct

cat us.env
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
