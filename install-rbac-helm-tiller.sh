source vault.env.us
kubectl create -f k8s-cls-admin.yaml
kubectl create -f helm-tiller-rbac.yaml
./init-helm.sh
