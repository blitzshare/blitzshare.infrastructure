# assuming that state s3 bucket already created

pushd ${PWD}/eu-west-1/s3/fileupload
terraform_v1.0.9 init 
terraform_v1.0.9 apply
popd

pushd ${PWD}/eu-west-1/ecr
terraform_v1.0.9 init
terraform_v1.0.9 apply
popd

pushd ${PWD}/eu-west-1/eks-cluster
terraform_v1.0.9 init 
terraform_v1.0.9 apply
popd

aws eks --region eu-west-1 update-kubeconfig --name blitzshare-eks-cluster


