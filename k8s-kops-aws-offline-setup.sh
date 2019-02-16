#!/usr/bin/env bash
## Setup vars
## Setup vars
source cn.env
## export KUBERNETES_VERSION=$(curl -fsSL --retry 5 "https://dl.k8s.io/release/stable.txt")
export KUBERNETES_VERSION=v1.13.3
## export KOPS_VERSION=$(curl -fsSL --retry 5 "https://api.github.com/repos/kubernetes/kops/releases/latest" | grep 'tag_name' | cut -d\" -f4)
export KOPS_VERSION=1.11.0-alpha.1
export ASSET_BUCKET="kubespray-assets"
export ASSET_PREFIX=""
#export AWS_REGION="us-gov-west-1"
export AWS_REGION="s3.cn-northwest-1.amazonaws.com.cn"

 #Please note that this filename of cni asset may change with kubernetes version
export CNI_FILENAME=cni-amd64-0799f5732f2a11b329d9e3d51b9c8f2e3759f2ff.tar.gz
export KOPS_BASE_URL=https://$AWS_REGION/$ASSET_BUCKET/kops/$KOPS_VERSION/
export CNI_VERSION_URL=https://$AWS_REGION/$ASSET_BUCKET/kubernetes/network-plugins/$CNI_FILENAME
## s3://s3.cn-northwest-1.amazonaws.com.cn/kubespray-assets/kubernetes-release/release/v1.13.3/bin/linux/amd64
## Download assets
KUBERNETES_ASSETS=(
  network-plugins/$CNI_FILENAME
  release/$KUBERNETES_VERSION/bin/linux/amd64/kube-apiserver.tar
  release/$KUBERNETES_VERSION/bin/linux/amd64/kube-controller-manager.tar
  release/$KUBERNETES_VERSION/bin/linux/amd64/kube-proxy.tar
  release/$KUBERNETES_VERSION/bin/linux/amd64/kube-scheduler.tar
  release/$KUBERNETES_VERSION/bin/linux/amd64/kubectl
  release/$KUBERNETES_VERSION/bin/linux/amd64/kubelet
  release/$KUBERNETES_VERSION/bin/linux/amd64/kubeadm
  release/$KUBERNETES_VERSION/bin/linux/amd64/hyperkube
)
for asset in "${KUBERNETES_ASSETS[@]}"; do
  dir="kubernetes/$(dirname "$asset")"
  mkdir -p "$dir"
  url="https://storage.googleapis.com/kubernetes-release/$asset"
  wget -P "$dir" "$url"
  [ "${asset##*.}" != "gz" ] && wget -P "$dir" "$url.sha1"
  [ "${asset##*.}" == "tar" ] && wget -P "$dir" "${url%.tar}.docker_tag"
done

KOPS_ASSETS=(
  "images/protokube.tar.gz"
  "linux/amd64/nodeup"
  "linux/amd64/utils.tar.gz"
)
for asset in "${KOPS_ASSETS[@]}"; do
  kops_path="kops/$KOPS_VERSION/$asset"
  dir="$(dirname "$kops_path")"
  mkdir -p "$dir"
  url="https://kubeupv2.s3.amazonaws.com/kops/$KOPS_VERSION/$asset"
  wget -P "$dir" "$url"
  wget -P "$dir" "$url.sha1"
done

## Upload assets

## Get default S3 multipart_threshold

AWS_S3_DEFAULT_MULTIPART_THRESHOLD=$(aws configure get default.s3.multipart_threshold)

if [ ! -n "$AWS_S3_DEFAULT_MULTIPART_THRESHOLD" ]; then
  AWS_S3_DEFAULT_MULTIPART_THRESHOLD=8MB
fi

## Set multipart_threshold to 1024MB to prevent Etag not returns MD5 when upload multipart

aws configure set default.s3.multipart_threshold 1024MB

#aws s3api create-bucket --bucket $ASSET_BUCKET --create-bucket-configuration LocationConstraint=$AWS_REGION
for dir in "kubernetes" "kops"; do
  aws s3 sync "$dir" "s3://$ASSET_BUCKET/$ASSET_PREFIX$dir"
done

aws configure set default.s3.multipart_threshold $AWS_S3_DEFAULT_MULTIPART_THRESHOLD
