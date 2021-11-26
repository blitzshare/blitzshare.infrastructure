
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

# k8s cluster config
aws eks --region ${REGION} update-kubeconfig --name ${REGION}-blitzshare-cluster
# kube mq
kubectl apply -f https://deploy.kubemq.io/init
kubectl apply -f https://deploy.kubemq.io/key/0a5e3867-1149-40cf-b9f0-fe8321f52439

# helm repo add kubemq-charts  https://kubemq-io.github.io/charts
# helm install kubemq-cluster --set key={your-license-key} kubemq-charts/kubemq -n kubemq 
# kubectl ctx blitzshare-cluster
# bash bin/eks/kluster-load-balancer-deploy.sh


