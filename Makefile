infra-create-aws:
	bash infra-create.sh eu-west-2 arn:aws:eks:eu-west-2:847574585735:cluster/eu-west-2-blitzshare-cluster
infra-destroy-aws:
	bash infra-destroy.sh eu-west-2
infra-create-k8s:
	[ -z "$(ctx)" ] && echo 'Please provide ctx name!' && exit 1 || :
	bash infra-k8s-create.sh $(ctx)
local-docker-cleanup:
	docker rm $(docker ps -a -f status=exited -q)
	docker rmi $(docker images -a -q)
