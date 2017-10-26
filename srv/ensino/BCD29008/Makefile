all: delete create

delete:
	kubectl delete -f Service.yaml --namespace=ensino
	helm delete --purge bcd29008
	kubectl delete -f PersistentVolumeClaim.yaml --namespace=ensino
	kubectl delete -f PersistentVolume.yaml --namespace=ensino

create:
	kubectl create -f PersistentVolume.yaml --namespace=ensino
	kubectl create -f PersistentVolumeClaim.yaml --namespace=ensino
	helm install --name bcd29008 --namespace ensino -f values.yaml stable/mysql
	kubectl create -f Service.yaml --namespace=ensino
