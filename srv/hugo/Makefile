all: delete create

namespace = producao

delete:
	kubectl delete --namespace=$(namespace) -f Ingress.yaml --namespace=producao
	kubectl delete --namespace=$(namespace) -f Service.yaml --namespace=producao
	kubectl delete --namespace=$(namespace) -f Deployment.yaml --namespace=producao
	kubectl delete --namespace=$(namespace) -f PersistentVolumeClaim.yaml --namespace=producao
	kubectl delete --namespace=$(namespace) -f PersistentVolume.yaml --namespace=producao

create:
	kubectl create --namespace=$(namespace) -f PersistentVolume.yaml --namespace=producao
	kubectl create --namespace=$(namespace) -f PersistentVolumeClaim.yaml --namespace=producao
	kubectl create --namespace=$(namespace) -f Deployment.yaml --namespace=producao
	kubectl create --namespace=$(namespace) -f Service.yaml --namespace=producao
	kubectl create --namespace=$(namespace) -f Ingress.yaml --namespace=producao
