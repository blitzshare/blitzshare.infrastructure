# assuming that state s3 bucket already created

pushd ${PWD}/eu-west-1/eks-cluster
terraform_v1.0.9 init
terraform_v1.0.9 destroy
popd

aws ec2 describe-instances --query "Reservations[*].Instances[*]" | jq
