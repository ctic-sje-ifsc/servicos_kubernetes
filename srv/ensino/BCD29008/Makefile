all: delete create

delete:
	kubectl delete -f Service.yaml
	helm delete --purge bcd29008
	kubectl delete -f PersistentVolumeClaim.yaml
	kubectl delete -f PersistentVolume.yaml

create:
	kubectl create -f PersistentVolume.yaml
	kubectl create -f PersistentVolumeClaim.yaml
	helm install --name bcd29008 --namespace ensino -f values.yaml stable/mysql
	kubectl create -f Service.yaml
