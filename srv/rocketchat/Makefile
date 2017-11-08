all: delete create

namespace = default

delete:
	#kubectl delete --namespace=$(namespace) -f Ingress.yaml
	kubectl delete --namespace=$(namespace) -f app-service.yaml
	kubectl delete --namespace=$(namespace) -f app-deployment.yaml
	kubectl delete --namespace=$(namespace) -f database-service.yaml
	kubectl delete --namespace=$(namespace) -f database-deployment.yaml
	kubectl delete --namespace=$(namespace) -f rocketchat-storage-pvc.yaml
	kubectl delete --namespace=$(namespace) -f rocketchat-storage-pv.yaml

create:
	kubectl create --namespace=$(namespace) -f rocketchat-storage-pv.yaml
	kubectl create --namespace=$(namespace) -f rocketchat-storage-pvc.yaml
	kubectl create --namespace=$(namespace) -f database-deployment.yaml
	kubectl create --namespace=$(namespace) -f database-service.yaml
	kubectl create --namespace=$(namespace) -f app-deployment.yaml
	kubectl create --namespace=$(namespace) -f app-service.yaml
	#kubectl create --namespace=$(namespace) -f Ingress.yaml
