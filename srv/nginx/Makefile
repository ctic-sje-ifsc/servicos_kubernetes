all: delete create

delete:
	kubectl delete -f HorizontalPodAutoscaler.yaml
	kubectl delete -f Service.yaml
	kubectl delete -f Deployment.yaml
	kubectl delete -f ConfigMap.yaml

create:
	kubectl create --save-config=true -f ConfigMap.yaml
	kubectl create --save-config=true -f Deployment.yaml
	kubectl create --save-config=true -f Service.yaml
	kubectl create --save-config=true -f HorizontalPodAutoscaler.yaml
