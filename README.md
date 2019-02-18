# kubespray-ansible-scripts
Ansible scripts to deploy multi-master HA kubernetes cluster with kubespray kubeadm

 Quickstart documentation

> Download kubernetes installer from code repository
first, change directory to working dir for example (~/working) and clone the github repository:

```
$ cd ~/working

$ git clone https://github.com/mpw07458/kubespray-ansible-scripts.git

$ cd kubespray-ansible-scripts

```

> Creating infrastructure for China AWS

```

$ cd contrib/terraform

$ cd aws-cn

```
> Ensure environment file "cn.env" is correct

```
$ cat cn.env
```

make AWS environment var are correct

> run ansible playbook
```
$ chmod +x create_cn_infra.sh

$ ./create_cn_infra.sh

```

> Creating infrastructure for US AWS

```

$ cd contrib/terraform

$ cd aws-us

```
> Ensure environment file "us.env" is correct

```
$ cat us.env
```

make AWS environment var are correct

> run ansible playbook
```
$ chmod +x create_us_infra.sh

$ ./create_us_infra.sh


