# assuming that state s3 bucket already created

pushd ${PWD}/eu-west-1/s3/fileshare
terraform_v1.0.9 init 
terraform_v1.0.9 apply
popd

pushd ${PWD}/eu-west-1/ecr/blitzshare-fileshare-api
terraform_v1.0.9 init
terraform_v1.0.9 apply
popd

pushd ${PWD}/eu-west-1/eks-cluster
terraform_v1.0.9 init 
terraform_v1.0.9 apply
popd

kubectl ctx arn:aws:eks:eu-west-1:587813402793:cluster/blitzshare-cluster



