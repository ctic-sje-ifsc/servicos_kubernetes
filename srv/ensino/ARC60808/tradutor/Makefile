all: delete create

delete:
	kubectl delete -f Service.yaml
	kubectl delete -f Deployment.yaml

create:
	kubectl create -f Deployment.yaml
	kubectl create -f Service.yaml
