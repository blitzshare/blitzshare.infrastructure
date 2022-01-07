kubectl delete namespace bootstrap-ns

REGION=eu-west-2

pushd ${PWD}/${REGION}/s3/tfstate
terraform_v1.0.9 init 
terraform_v1.0.9 destroy
popd


pushd ${PWD}/${REGION}/s3/fileshare
terraform_v1.0.9 init 
terraform_v1.0.9 destroy
popd

pushd ${PWD}/${REGION}/eks-cluster
terraform_v1.0.9 init 
terraform_v1.0.9 destroy
popd

