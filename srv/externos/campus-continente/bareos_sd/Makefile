all: delete create

namespace = continente

delete:
	kubectl delete --namespace=$(namespace) -f Service.yaml 
	kubectl delete --namespace=$(namespace) -f Deployment.yaml 
	kubectl delete --namespace=$(namespace) -f PersistentVolumeClaim.yaml 
	kubectl delete --namespace=$(namespace) -f PersistentVolume.yaml
	kubectl delete --namespace=$(namespace) -f Secret.yaml 

create:
	kubectl create --namespace=$(namespace) -f Secret.yaml 
	kubectl create --namespace=$(namespace) -f PersistentVolume.yaml 
	kubectl create --namespace=$(namespace) -f PersistentVolumeClaim.yaml 
	kubectl create --namespace=$(namespace) -f Deployment.yaml 
	kubectl create --namespace=$(namespace) -f Service.yaml 
