all: delete create

delete:
	kubectl delete -f Deployment.yaml
	kubectl delete -f PersistentVolumeClaim.yaml
	kubectl delete -f PersistentVolume.yaml
	kubectl delete -f nogit-ConfigMap.yaml
	kubectl delete -f Secret.yaml

create:
	kubectl create -f Secret.yaml
	kubectl create -f nogit-ConfigMap.yaml
	kubectl create -f PersistentVolume.yaml
	kubectl create -f PersistentVolumeClaim.yaml
	kubectl create -f Deployment.yaml
