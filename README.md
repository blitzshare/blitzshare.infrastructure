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
$ kubectl ctx arn:aws:eks:eu-west-1:579085511364:cluster/education-eks-qX9i6LYp
```

other:
terraform_v1.0.9 state rm module.eks.kubernetes_config_map.aws_auth