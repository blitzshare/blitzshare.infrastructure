# Configure kubectl context with aws eks cluster
aws eks --region eu-west-1 update-kubeconfig --name blitzshare-eks-cluster
kubectl ctx arn:aws:eks:eu-west-1:579085511364:cluster/blitzshare-eks-cluster

# install dashboard
kubectl apply -f https://raw.githubusercontent.com/kubernetes/dashboard/v2.3.1/aio/deploy/recommended.yaml

kubectl apply -f ${PWD}/dashboard.admin-user.yml

echo "> AUTH TOKEN:"

kubectl -n kubernetes-dashboard get secret $(kubectl -n kubernetes-dashboard get sa/admin-user -o jsonpath="{.secrets[0].name}") -o go-template="{{.data.token | base64decode}}"
echo "< AUTH TOKEN"
kubectl proxy
# http://localhost:8001/api/v1/namespaces/kubernetes-dashboard/services/https:kubernetes-dashboard:/proxy/#/login
#helm repo add k8s-dashboard https://kubernetes.github.io/dashboard