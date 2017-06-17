all: delete create

delete:
	kubectl delete -f HorizontalPodAutoscaler.yaml
	kubectl delete -f Service.yaml
	kubectl delete -f Deployment.yaml
	kubectl delete -f ConfigMap.yaml

create:
	kubectl create -f ConfigMap.yaml
	kubectl create -f Deployment.yaml
	kubectl create -f Service.yaml
	kubectl create -f HorizontalPodAutoscaler.yaml
