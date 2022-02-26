#!/bin/bash

CONTEXT=$1
TIMEOUT=120s
BLITZ_NS=blitzshare-ns

if [ "CONTEXT" == "" ]; then
    echo "context not defined"
    exit 1
fi
log_info(){
  echo -e "\n[INFO] $1\n"
}

log_info "running deployment ctx=${CONTEXT} ns=${BLITZ_NS}"
print_something ctx ${CONTEXT} # setup k8s context

# papertrail logs deamon set config
# kubectl create secret generic papertrail-destination --from-literal=papertrail-destination=syslog+tls://logs.papertrailapp.com:39117
# kubectl apply -f ./k8s/papertrail-logspout-daemonset.yml
# log_info 'papertrail logsoyt configured'

# kubemq
STATEFUL_SET=kubemq-cluster
kubectl apply -f https://deploy.kubemq.io/init
kubectl apply -f https://deploy.kubemq.io/key/7c26d506-75bc-4c88-ae58-0992999b3749
if kubectl rollout status statefulset.apps/${STATEFUL_SET} -n kubemq --timeout=$TIMEOUT; then
  echo 'deployment/${STATEFUL_SET} successfully deployed'
else
  exit 1
fi

# redis store pod
kubectl apply -f k8s/redis.yml
# kubemq worker
DEPLOYMENT=blitzshare-event-worker-dpl
pushd ../blitzshare.event.worker
make k8s-apply
popd
if kubectl rollout status deployment/${DEPLOYMENT} -n ${BLITZ_NS} --timeout=$TIMEOUT; then
  log_info 'deployment/${DEPLOYMENT} successfully deployed'
else
  exit 1
fi

# k8s bootstrap service
DEPLOYMENT=blitzshare-bootstrap-dpl
pushd ../blitzshare.bootstrap.node
make k8s-apply
popd

if kubectl rollout status deployment/${DEPLOYMENT} -n ${BLITZ_NS} --timeout=$TIMEOUT; then
  log_info 'deployment/${DEPLOYMENT} successfully deployed'
else
  exit 1
fi

# k8s blitzshare api
DEPLOYMENT=blitzshare-api-dpl
pushd ../blitzshare.api
make k8s-apply
if kubectl rollout status deployment/${DEPLOYMENT} -n ${BLITZ_NS} --timeout=$TIMEOUT; then
  log_info 'deployment/${DEPLOYMENT} successfully deployed'
else
  exit 1
fi
# set k8s namespace
kubectl ns blitzshare-ns

# traefik install/config
helm repo add traefik https://helm.traefik.io/traefik
helm repo update
helm install traefik traefik/traefik
helm upgrade traefik traefik/traefik -f ./k8s/traefik/traefik.values.yml
kubectl apply -f ./k8s/traefik/traefik.blitzshare-api-crd.yaml

DEPLOYMENT=traefik 
if kubectl rollout status deployment/${DEPLOYMENT} -n ${BLITZ_NS} --timeout=$TIMEOUT; then
  log_info 'deployment/${DEPLOYMENT} successfully deployed'
else
  exit 1
fi
