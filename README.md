## kubespray-ansible-scripts
Ansible scripts to deploy multi-master HA kubernetes cluster with kubespray kubeadm

# Quickstart documentation

> Download kubernetes installer from code repository
first, change directory to working dir for example (~/working) and clone the github repository:

```
$ cd ~/<<working dir>>

$ git clone https://github.com/mpw07458/kubespray-ansible-scripts.git

$ cd kubespray-ansible-scripts

```

> Creating infrastructure for China AWS

```

$ cd contrib/terraform

$ cd aws-cn

```
> Make sure environment file "cn-northwest-1.env" is correct

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
> make sure AWS environment var are correct

> Run ansible playbook

```
$ chmod +x create-cn-infra.sh

$ ./create-cn-infra.sh

```

> Creating infrastructure for US AWS

```

$ cd contrib/terraform

$ cd aws-us

```
> Make sure environment file "us-west-1.env" is correct

```
$ cat us-west-1.env
#AWS Access Key
AWS_ACCESS_KEY_ID = ""
#AWS Secret Key
AWS_SECRET_ACCESS_KEY = ""
#EC2 SSH Key Name
AWS_SSH_KEY_NAME = ""
#AWS Region
AWS_DEFAULT_REGION = "us-west-1"
```

> run ansible playbook
```
$ chmod +x create-us-infra.sh

$ ./create-us-infra.sh
```

> Save state object for infrastructure

```
$ mkdir {$Date}-state

$ cp terraform.state  {$Date}-state/.
```
> Make sure the inventory/hosts file is correct for the infrastructure

```
$ cd ~/<<working dir>>/kubespray-ansible-scripts

$ cat inventory/hosts
[all]
kubernetes-test-master0 ansible_host=10.250.207.40
kubernetes-test-master1 ansible_host=10.250.221.110
kubernetes-test-master2 ansible_host=10.250.193.183
kubernetes-test-worker0 ansible_host=10.250.204.107
kubernetes-test-worker1 ansible_host=10.250.217.217
kubernetes-test-worker2 ansible_host=10.250.200.7
kubernetes-test-etcd0 ansible_host=10.250.197.25
kubernetes-test-etcd1 ansible_host=10.250.215.198
kubernetes-test-etcd2 ansible_host=10.250.195.205
bastion ansible_host=18.144.29.210
bastion ansible_host=13.56.179.128

[bastion]
bastion ansible_host=18.144.29.210
bastion ansible_host=13.56.179.128

[kube-master]
kubernetes-test-master0
kubernetes-test-master1
kubernetes-test-master2


[kube-node]
kubernetes-test-worker0
kubernetes-test-worker1
kubernetes-test-worker2


[etcd]
kubernetes-test-etcd0
kubernetes-test-etcd1
kubernetes-test-etcd2


[k8s-cluster:children]
kube-node
kube-master


[k8s-cluster:vars]
apiserver_loadbalancer_domain_name="kubernetes-elb-test-53736937.us-west-1.elb.amazonaws.com"
```
copy inventory/hosts and ssh-bastion.conf to bastion machine
```
$ scp -i ~/.ssh/kubespray-us.pem inventory/hosts ubuntu@<<ip or dns bastion>>:~/.
 
$ scp -i ~/.ssh/kubespray-us.pem ssh-bastion.conf ubuntu@<<ip or dns bastion>>:~/.

$ ssh -i ~/.ssh/kubespray-us.pem ubuntu@<<ip or dns bastion>>
```

> Verify you are logged into bastion

> Create working directory

```
$ mkdir ~/<<working dir>>
```
>  Clone github repo
```
$ cd ~/<<working dir>>

$ git clone https://github.com/mpw07458/kubespray-ansible-scripts.git
```

> copy hosts file and ssh-bastion.conf file from local machine

```
$ mv ../hosts kubespray-ansible-scripts/inventory/.

$ mv ../ssh-bastion.conf  kubespray-ansible-scripts/.

$ cd kubespray-ansible-scripts

```

> Review ssh-bastion.conf file

```
cat ssh-bastion.conf


Host 52.82.41.177
  Hostname 52.82.41.177
  StrictHostKeyChecking no
  ControlMaster auto
  ControlPath ~/.ssh/ansible-%r@%h:%p
  ControlPersist 5m

Host  10.250.194.108 10.250.212.221 10.250.202.128 10.250.193.66 10.250.218.69 10.250.198.25 10.250.203.30 10.250.209.219 10.250.204.154
  ProxyCommand ssh -o StrictHostKeyChecking=no -o UserKnownHostsFile=/dev/null -W %h:%p ubuntu@52.82.41.177
  ```
> login to each node and master and pass keys

repeat at each node

```
ssh -F ssh-bastion.conf ubuntu@<<machine1>>
```
> Install kubernetes from the bastion machine

