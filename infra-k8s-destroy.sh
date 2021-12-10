#!/bin/bash

CONTEXT=arn:aws:eks:eu-west-2:847574585735:cluster/eu-west-2-blitzshare-cluster
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