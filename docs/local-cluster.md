### Minikube
[minikube installation](https://k8s-docs.netlify.app/en/docs/tasks/tools/install-minikube/)
```bash
# minikube - launching k8s resources
$ make infra-create-k8s ctx=minikube
# minikube tunnel connections
$ minikube tunnel
```

### k3d
[k3d installation](https://vhs.codeberg.page/post/kubernetes-macos-k3s-k3d-rancher/)

```bash
# minikube - launching k8s resources
$ make infra-create-k8s ctx=k3d-blitzshare
```

```bash
# create cluster
$ k3d cluster create blitzshare
# list clusters
$ k3d cluster list
# list nodes
$ kubectl get nodes
```
