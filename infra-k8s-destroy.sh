#!/bin/bash

CONTEXT=minikube
# setup k8s context
kubectl ctx $CONTEXT

namespaces=$(kubectl get namespace | awk '{ print $1 }')
for NS in $(kubectl get namespace | awk '{ print $1 }')
do
    
    if [[ $NS =~ "kube-" ]]; then
        echo "skipping kube ns: ${NS}" 
    else
        echo "deleting ${NS} k8s namespace"
        kubectl delete namespace ${NS}
    fi
done