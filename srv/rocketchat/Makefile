all: delete create

delete:
	kubectl delete -f app-service.yaml
	kubectl delete -f app-deployment.yaml
	kubectl delete -f database-service.yaml
	kubectl delete -f database-deployment.yaml
	kubectl delete -f rocketchat-storage-pvc.yaml
	kubectl delete -f rocketchat-storage-pv.yaml

create:
	kubectl create -f app-service.yaml
	kubectl create -f app-deployment.yaml
	kubectl create -f database-service.yaml
	kubectl create -f database-deployment.yaml
	kubectl create -f rocketchat-storage-pvc.yaml
	kubectl create -f rocketchat-storage-pv.yaml
