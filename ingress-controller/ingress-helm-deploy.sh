 helm install stable/nginx-ingress --name internal --namespace ingress-nginx -f values.yaml --set controller.replicaCount=3 --set rbac.create=true
