all: delete create

delete:
	kubectl delete -f Ingress.yaml --namespace=producao
	kubectl delete -f app-service.yaml --namespace=producao
	kubectl delete -f app-deployment.yaml --namespace=producao
	kubectl delete -f database-service.yaml --namespace=producao
	kubectl delete -f database-deployment.yaml --namespace=producao
	kubectl delete -f rocketchat-storage-pvc.yaml --namespace=producao
	kubectl delete -f rocketchat-storage-pv.yaml --namespace=producao

create:
	kubectl create -f rocketchat-storage-pv.yaml --namespace=producao
	kubectl create -f rocketchat-storage-pvc.yaml --namespace=producao
	kubectl create -f database-deployment.yaml --namespace=producao
	kubectl create -f database-service.yaml --namespace=producao
	kubectl create -f app-deployment.yaml --namespace=producao
	kubectl create -f app-service.yaml --namespace=producao
	kubectl create -f Ingress.yaml --namespace=producao
