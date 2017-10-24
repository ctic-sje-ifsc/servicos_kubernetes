all: delete create

delete:
	kubectl delete -f Ingress.yaml --namespace=projetos
	kubectl delete -f Service.yaml --namespace=projetos
	kubectl delete -f Deployment.yaml --namespace=projetos
	kubectl delete -f PersistentVolumeClaim.yaml --namespace=projetos
	kubectl delete -f PersistentVolume.yaml --namespace=projetos
	kubectl delete -f ConfigMap.yaml --namespace=projetos

create:
	kubectl create -f ConfigMap.yaml --namespace=projetos
	kubectl create -f PersistentVolume.yaml --namespace=projetos
	kubectl create -f PersistentVolumeClaim.yaml --namespace=projetos
	kubectl create -f Deployment.yaml --namespace=projetos
	kubectl create -f Service.yaml --namespace=projetos
	kubectl create -f Ingress.yaml --namespace=projetos
