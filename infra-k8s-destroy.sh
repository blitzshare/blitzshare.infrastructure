CONTEXT=$1
if [ "CONTEXT" == "" ]; then
    echo "context not defined"
    exit 1
fi

# setup k8s context
kubectl ctx $CONTEXT

kubectl delete namespace blitzshare-ns
kubectl delete namespace blitzshare-ns
kubectl delete namespace blitzshare-redis-ns
kubectl delete namespace kubemq


