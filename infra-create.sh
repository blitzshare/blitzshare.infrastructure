REGION=eu-west-2
pushd ${PWD}/${REGION}/s3/tfstate
terraform_v1.0.9 init 
terraform_v1.0.9 apply
popd

pushd ${PWD}/${REGION}/eks-cluster
terraform_v1.0.9 init 
terraform_v1.0.9 apply
popd

# k8s cluster config
aws eks --region ${REGION} update-kubeconfig --name ${REGION}-blitzshare-cluster

# k8s apply
bash ${PWD}/infra-k8s-create.sh arn:aws:eks:eu-west-2:847574585735:cluster/eu-west-2-blitzshare-cluster
