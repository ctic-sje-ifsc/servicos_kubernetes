all: delete create

delete:
	kubectl delete -f Ingress.yaml --namespace=producao
	kubectl delete -f Service.yaml --namespace=producao
	kubectl delete -f Deployment.yaml --namespace=producao
	kubectl delete -f PersistentVolumeClaim.yaml --namespace=producao
	kubectl delete -f PersistentVolume.yaml --namespace=producao
	kubectl delete -f ConfigMap.yaml --namespace=producao
	kubectl delete -f Secrets.yaml --namespace=producao

create:
	kubectl create -f Secrets.yaml --namespace=producao
	kubectl create -f ConfigMap.yaml --namespace=producao
	kubectl create -f PersistentVolume.yaml --namespace=producao
	kubectl create -f PersistentVolumeClaim.yaml --namespace=producao
	kubectl create -f Deployment.yaml --namespace=producao
	kubectl create -f Service.yaml --namespace=producao
	kubectl create -f Ingress.yaml --namespace=producao
