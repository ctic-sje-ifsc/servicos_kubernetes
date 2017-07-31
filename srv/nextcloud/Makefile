all: delete create

delete:
	kubectl delete -f Service.yaml
	kubectl delete -f Deployment.yaml
	kubectl delete -f PersistentVolumeClaim.yaml
	kubectl delete -f PersistentVolume.yaml
	kubectl delete -f ConfigMap.yaml
	kubectl delete -f Secrets.yaml
	
create:
	kubectl create -f Secrets.yaml
	kubectl create -f ConfigMap.yaml
	kubectl create -f PersistentVolume.yaml
	kubectl create -f PersistentVolumeClaim.yaml
	kubectl create -f Deployment.yaml
	kubectl create -f Service.yaml
