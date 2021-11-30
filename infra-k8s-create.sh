

# setup k8s context
kubectl ctx docker-desktop

# kube mq
kubectl apply -f https://deploy.kubemq.io/init
kubectl apply -f https://deploy.kubemq.io/key/0a5e3867-1149-40cf-b9f0-fe8321f52439

# redis store
kubectl apply -f k8s/redis.yml

# kubemq worker
pushd ../blitzshare.event.worker
make k8s-apply
popd

# k8s bootstrap service
pushd ../blitzshare.bootstrap.node
make k8s-apply
popd

# k8s blitzshare api
pushd ../blitzshare.api
make k8s-apply
popd

# helm repo add kubemq-charts  https://kubemq-io.github.io/charts
# helm install kubemq-cluster --set key={your-license-key} kubemq-charts/kubemq -n kubemq 
# kubectl ctx blitzshare-cluster
# bash bin/eks/kluster-load-balancer-deploy.sh


