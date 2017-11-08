all: delete create

namespace = ensino

delete:
	kubectl delete --namespace=$(namespace) -f Service.yaml
	helm delete --purge bcd29008
	kubectl delete --namespace=$(namespace) -f PersistentVolumeClaim.yaml
	kubectl delete --namespace=$(namespace) -f PersistentVolume.yaml

create:
	kubectl create --namespace=$(namespace) -f PersistentVolume.yaml
	kubectl create --namespace=$(namespace) -f PersistentVolumeClaim.yaml
	helm install --name bcd29008 --namespace $(namespace) -f values.yaml stable/mysql
	kubectl create --namespace=$(namespace) -f Service.yaml
