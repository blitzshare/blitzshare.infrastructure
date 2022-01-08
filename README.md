# blitzshare.infrastructure
blitzshare project Infrastructure repository

## infrastructure creation
```bash
$ make infra-create
```
General Steps:
1. Create of Terraform AWS S3 bucket state - terraform state and configuration store, used by terraform to map real world resources to configuration.
2. Create of EKS cluster (including Networking and Security groups)
3. Create Kubernetes resources.


## infrastructure deletion
```bash
$ make infra-destroy
```
General Steps:
1. Delete Kubernetes namespace - blitzshare-ns
2. Delete EKS Cluster
3. Delete of Terraform AWS S3 bucket state 


## launching k8s resources in local minikube cluster
```bash
$ make infra-k8s-create-minikube
```