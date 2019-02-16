source cn.env
aws configure set default.s3.multipart_threshold 1024MB
aws s3 cp s3://kubespray-assets/kubespray/kubespray-cn.tar.gz .
