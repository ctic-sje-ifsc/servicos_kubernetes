all: delete create

namespace = default

delete:
	kubectl delete --namespace=$(namespace) Ingress.yaml
	kubectl delete --namespace=$(namespace) HorizontalPodAutoscaler.yaml
	kubectl delete --namespace=$(namespace) Service.yaml
	kubectl delete --namespace=$(namespace) Deployment.yaml
	kubectl delete --namespace=$(namespace) PersistentVolumeClaim.yaml
	kubectl delete --namespace=$(namespace) PersistentVolume.yaml
	kubectl delete --namespace=$(namespace) Secret.yaml

create:
	kubectl create --namespace=$(namespace) Secret.yaml
	kubectl create --namespace=$(namespace) PersistentVolume.yaml
	kubectl create --namespace=$(namespace) PersistentVolumeClaim.yaml
	kubectl create --namespace=$(namespace) Deployment.yaml
	kubectl create --namespace=$(namespace) Service.yaml
	kubectl create --namespace=$(namespace) HorizontalPodAutoscaler.yaml
	kubectl create --namespace=$(namespace) Ingress.yaml
