infra-create:
	bash infra-create.sh eu-west-2 arn:aws:eks:eu-west-2:847574585735:cluster/eu-west-2-blitzshare-cluster
infra-k8s-create:
	bash infra-k8s-create.sh arn:aws:eks:eu-west-2:847574585735:cluster/eu-west-2-blitzshare-cluster
infra-destroy:
	bash infra-destroy.sh eu-west-2
infra-k8s-create-minikube:
	bash infra-k8s-create.sh minikube
local-docker-cleanup:
	docker rm $(docker ps -a -f status=exited -q)
	docker rmi $(docker images -a -q)