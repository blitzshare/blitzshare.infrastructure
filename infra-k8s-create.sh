

# setup k8s context
kubectl ctx minikube

# k8s cluster config



# kube mq
kubectl apply -f https://deploy.kubemq.io/init
kubectl apply -f https://deploy.kubemq.io/key/0a5e3867-1149-40cf-b9f0-fe8321f52439

# redis store
kubectl apply -f k8s/redis.yml


# k8s bootstrap service
pushd ../blitzshare.bootstrap.node
# git pull
make k8s-apply
popd




# helm repo add kubemq-charts  https://kubemq-io.github.io/charts
# helm install kubemq-cluster --set key={your-license-key} kubemq-charts/kubemq -n kubemq 
# kubectl ctx blitzshare-cluster
# bash bin/eks/kluster-load-balancer-deploy.sh


