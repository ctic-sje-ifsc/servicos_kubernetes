all: delete create

namespace = producao

delete:
	helm delete --purge moodle
	kubectl delete pvc --namespace=$(namespace) data-moodle-mariadb-0
	kubectl delete --namespace=$(namespace) -f PersistentVolume.yaml

create:
	kubectl create --namespace=$(namespace) -f PersistentVolume.yaml
	helm install --name moodle --namespace=$(namespace) -f values.yaml stable/moodle