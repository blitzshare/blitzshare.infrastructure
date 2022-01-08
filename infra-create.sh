REGION=$1
if [ "REGION" == "" ]; then
    echo "region is not defined!"
    exit 1
fi
CONTEXT=$2
if [ "CONTEXT" == "" ]; then
    echo "context is not defined!"
    exit 1
fi
# create terraform state s3 bucket
pushd ${PWD}/${REGION}/s3/tfstate
terraform_v1.0.9 init 
terraform_v1.0.9 apply
popd
# create eks cluster
pushd ${PWD}/${REGION}/eks-cluster
terraform_v1.0.9 init 
terraform_v1.0.9 apply
popd
# set k8s cluster config
aws eks --region ${REGION} update-kubeconfig --name ${REGION}-blitzshare-cluster
# create kubernetes resources
bash ${PWD}/infra-k8s-create.sh $CONTEXT
