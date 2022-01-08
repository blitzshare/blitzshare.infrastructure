REGION=$1
if [ "REGION" == "" ]; then
    echo "region is not defined!"
    exit 1
fi
# delete kuberbetes blitzshare resources
kubectl delete namespace blitzshare-ns
# destroy eks cluster
pushd ${PWD}/${REGION}/eks-cluster
terraform_v1.0.9 init 
terraform_v1.0.9 destroy
popd
# destroy terraform state s3 bucket
pushd ${PWD}/${REGION}/s3/tfstate
terraform_v1.0.9 init 
terraform_v1.0.9 destroy
popd
