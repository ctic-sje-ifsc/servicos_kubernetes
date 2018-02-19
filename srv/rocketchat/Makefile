all: delete create

delete:
	kubectl delete -f Ingress.yaml
	kubectl delete -f Service.yaml
	kubectl delete -f Deployment.yaml
	kubectl delete -f Filesystem.yaml
	kubectl delete -f Secret.yaml

create:
	kubectl create -f Secret.yaml
	kubectl create -f Filesystem.yaml
	kubectl create -f Deployment.yaml
	kubectl create -f Service.yaml
	kubectl create -f Ingress.yaml
