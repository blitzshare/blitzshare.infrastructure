
## infrastructure creation
```bash
# AWS infra create
$ make infra-create-aws
```pushd ../blitzshare.event.worker
General Steps:
1. Create of Terraform AWS S3 bucket state - terraform state and configuration store, used by terraform to map real world resources to configuration.
2. Create of EKS cluster (including Networking and Security groups)
3. Create Kubernetes resources.


## infrastructure deletion
```bash
# AWS infra destroy
$ make infra-destroy
```
General Steps:
1. Delete Kubernetes namespace - blitzshare-ns
2. Delete EKS Cluster
3. Delete of Terraform AWS S3 bucket state 