
# assuming that state s3 bucket already created

REGION=eu-west-2
pushd ${PWD}/${REGION}/s3/tfstate
terraform_v1.0.9 init 
terraform_v1.0.9 apply
popd


pushd ${PWD}/${REGION}/s3/fileshare
terraform_v1.0.9 init 
terraform_v1.0.9 apply
popd

pushd ${PWD}/${REGION}/ecr/blitzshare-fileshare-api
terraform_v1.0.9 init
terraform_v1.0.9 apply
popd

pushd ${PWD}/${REGION}/eks-cluster
terraform_v1.0.9 init 
terraform_v1.0.9 apply
popd

aws eks --region ${REGION} update-kubeconfig --name blitzshare-cluster
kubectl ctx blitzshare-cluster
bash bin/eks/kluster-load-balancer-deploy.sh





