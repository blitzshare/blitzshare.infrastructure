
# kubernetes 
kubectl delete namespaces file-share-ns
kubectl delete namespaces hello-world

# terraform
pushd ${PWD}/eu-west-1/eks-cluster
terraform_v1.0.9 init
terraform_v1.0.9 destroy
popd

aws ec2 describe-instances --query "Reservations[*].Instances[*]" | jq
