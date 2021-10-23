# blitzshare.infrastructure
blitzshare project Infrastructure repository

# MFA
Example of aws mfa login:
```bash
$ aws sts get-session-token --serial-number arn:aws:iam::579085511364:mfa/Pavel --token-code 971859
```

## K8s 
ctx
```
$ kubectl ctx arn:aws:eks:eu-west-1:579085511364:cluster/blitzshare-eks-cluster

```

other:
terraform_v1.0.9 state rm module.eks.kubernetes_config_map.aws_auth

# AWS
https://aws.amazon.com/blogs/aws/ec2-update-t2-nano-instances-now-available/
# dashboard
kubectl get service kubernetes-dashboard -n kubernetes-dashboard
echo $(kubectl -n kubernetes-dashboard get secret $(sudo kubectl -n kubernetes-dashboard get sa/admin-user -o jsonpath="{.secrets[0].name}") -o go-template="{{.data.token | base64decode}}")

kubectl get pods --all-namespaces
kubectl get services --all-namespaces

kubectl delete namespace kubernetes-dashboard