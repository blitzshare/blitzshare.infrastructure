
# assuming that state s3 bucket already created

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
bash ${PWD}/infra-k8s-create.sh
# helm repo add kubemq-charts  https://kubemq-io.github.io/charts
# helm install kubemq-cluster --set key={your-license-key} kubemq-charts/kubemq -n kubemq 
# kubectl ctx blitzshare-cluster
# bash bin/eks/kluster-load-balancer-deploy.sh


