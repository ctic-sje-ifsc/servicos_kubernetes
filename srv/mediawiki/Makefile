all: delete create

delete:
	kubectl delete -f Ingress.yaml --namespace=desenvolvimento
	kubectl delete -f Service.yaml --namespace=desenvolvimento
	kubectl delete -f Deployment.yaml --namespace=desenvolvimento
	kubectl delete -f PersistentVolumeClaim.yaml --namespace=desenvolvimento
	kubectl delete -f PersistentVolume.yaml --namespace=desenvolvimento
	kubectl delete -f ConfigMap.yaml --namespace=desenvolvimento
	kubectl delete -f Secrets.yaml --namespace=desenvolvimento

create:
	kubectl create -f Secrets.yaml --namespace=desenvolvimento
	kubectl create -f ConfigMap.yaml --namespace=desenvolvimento
	kubectl create -f PersistentVolume.yaml --namespace=desenvolvimento
	kubectl create -f PersistentVolumeClaim.yaml --namespace=desenvolvimento
	kubectl create -f Deployment.yaml --namespace=desenvolvimento
	kubectl create -f Service.yaml --namespace=desenvolvimento
	kubectl create -f Ingress.yaml --namespace=desenvolvimento
