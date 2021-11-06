#!/usr/bin/env bash

# https://docs.aws.amazon.com/eks/latest/userguide/aws-load-balancer-controller.html

#source bin/eks/kluster-connect
KLUSTER_NAME=blitzshare-cluster
DOMAIN_NAME=blitzshare
AWS_ACCOUNT=587813402793

eksctl create iamserviceaccount \
    --name "${KLUSTER_NAME}-load-balancer" \
    --namespace kube-system \
    --cluster ${KLUSTER_NAME} \
    --attach-policy-arn "arn:aws:iam::${AWS_ACCOUNT}:policy/${DOMAIN_NAME}-kluster-load-balancer-iam-policy" \
    --role-name ${DOMAIN_NAME}-load-balancer-role \
    --override-existing-serviceaccounts \
    --approve

kubectl apply -k "github.com/aws/eks-charts/stable/aws-load-balancer-controller//crds?ref=master"
helm repo add eks 'https://aws.github.io/eks-charts'

helm upgrade -i aws-load-balancer-controller eks/aws-load-balancer-controller \
  --set clusterName=${KLUSTER_NAME} \
  --set serviceAccount.create=false \
  --set serviceAccount.name="${DOMAIN_NAME}-load-balancer" \
  -n kube-system

kubectl wait --for=condition=available --timeout=600s deployment/aws-load-balancer-controller -n kube-system

kubectl get deployment -n kube-system aws-load-balancer-controller