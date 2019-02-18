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
> Make sure environment file "credentials.tfvars.cn" is correct

```
$ cat cn-northwest-1.env
#AWS Access Key
AWS_ACCESS_KEY_ID = ""
#AWS Secret Key
AWS_SECRET_ACCESS_KEY = ""
#EC2 SSH Key Name
AWS_SSH_KEY_NAME = ""
#AWS Region
AWS_DEFAULT_REGION = "cn-northwest-1"
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
> Make sure environment file "us.env" is correct

```
``
> Make sure environment file "credentials.tfvars.us" is correct

```
$ cat credentials.tfvars.us
#AWS Access Key
AWS_ACCESS_KEY_ID = ""
#AWS Secret Key
AWS_SECRET_ACCESS_KEY = ""
#EC2 SSH Key Name
AWS_SSH_KEY_NAME = ""
#AWS Region
AWS_DEFAULT_REGION = "eu-central-1"
```

> run ansible playbook
```
$ chmod +x create_us_infra.sh

$ ./create_us_infra.sh
