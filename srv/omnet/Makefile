all: delete create

namespace = testes

delete:
	kubectl delete --namespace=$(namespace) -f Deployment.yaml
	kubectl delete --namespace=$(namespace) -f HorizontalPodAutoscaler.yaml
	kubectl delete --namespace=$(namespace) -f Service.yaml
	kubectl delete --namespace=$(namespace) -f PersistentVolumeClaim.yaml
	kubectl delete --namespace=$(namespace) -f PersistentVolume.yaml

create:
	kubectl create --namespace=$(namespace) -f PersistentVolume.yaml
	kubectl create --namespace=$(namespace) -f PersistentVolumeClaim.yaml
	kubectl create --namespace=$(namespace) -f Service.yaml
	kubectl create --namespace=$(namespace) -f HorizontalPodAutoscaler.yaml
	kubectl create --namespace=$(namespace) -f Deployment.yaml
