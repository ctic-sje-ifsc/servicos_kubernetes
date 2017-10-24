all: delete create

delete:
	kubectl delete -f Service.yaml --namespace=testes
	kubectl delete -f Deployment.yaml --namespace=testes
	kubectl delete -f PersistentVolumeClaim.yaml --namespace=testes
	kubectl delete -f PersistentVolume.yaml --namespace=testes

create:
	kubectl create -f PersistentVolume.yaml --namespace=testes
	kubectl create -f PersistentVolumeClaim.yaml --namespace=testes
	kubectl create -f Deployment.yaml --namespace=testes
	kubectl create -f Service.yaml --namespace=testes
