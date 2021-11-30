

# setup k8s context
kubectl ctx minikube

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
