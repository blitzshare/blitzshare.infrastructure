
CONTEXT=minikube
# setup k8s context
kubectl ctx ${CONTEXT}

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

# k8s ingress
helm upgrade --install ingress-nginx ingress-nginx \
  --repo https://kubernetes.github.io/ingress-nginx \
  --namespace ingress-nginx --create-namespace

kubectl wait --namespace ingress-nginx \
  --for=condition=ready pod \
  --selector=app.kubernetes.io/component=controller \
  --timeout=120s

# https://kubernetes.github.io/ingress-nginx/deploy/
kubectl apply -f ./k8s/ingress.yaml