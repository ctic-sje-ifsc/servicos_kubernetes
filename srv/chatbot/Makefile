all: delete create

delete:
	kubectl delete -f Deployment.yaml --namespace=desenvolvimento
	kubectl delete -f PersistentVolumeClaim.yaml --namespace=desenvolvimento
	kubectl delete -f PersistentVolume.yaml --namespace=desenvolvimento
	kubectl delete -f Secret.yaml --namespace=desenvolvimento

create:
	kubectl create -f Secret.yaml --namespace=desenvolvimento
	kubectl create -f PersistentVolume.yaml --namespace=desenvolvimento
	kubectl create -f PersistentVolumeClaim.yaml --namespace=desenvolvimento
	kubectl create -f Deployment.yaml --namespace=desenvolvimento
