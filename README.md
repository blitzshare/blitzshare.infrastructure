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


## Adding user to k8s
```bash
# Please edit the object below. Lines beginning with a '#' will be ignored,
# and an empty file will abort the edit. If an error occurs while saving this file will be
# reopened with the relevant failures.
#
apiVersion: v1
data:
  mapAccounts: |
    []
  mapRoles: |
    - "groups":
      - "system:bootstrappers"
      - "system:nodes"
      "rolearn": "arn:aws:iam::847574585735:role/eu-west-2-blitzshare-cluster2021111909301403510000000a"
      "username": "system:node:{{EC2PrivateDNSName}}"
  mapUsers: |
    - groups:
      - system:masters
      userarn: arn:aws:iam::847574585735:user/saleem
      username: saleem
kind: ConfigMap
metadata:
  creationTimestamp: "2021-11-19T09:31:23Z"
  labels:
    app.kubernetes.io/managed-by: Terraform
    terraform.io/module: terraform-aws-modules.eks.aws
  name: aws-auth
  namespace: kube-system
  resourceVersion: "12439"
  uid: 536a7ffe-2067-4de7-98c3-952749ad1f60
```

M: bbk aws
Email: pav3ldurov+aws@gmail.com