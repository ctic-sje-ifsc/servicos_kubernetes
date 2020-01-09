all: delete create

namespace = testes

delete:
	helm delete moodle --namespace=$(namespace)
	kubectl delete pvc --namespace=$(namespace) data-moodle-mariadb-0
	kubectl delete --namespace=$(namespace) -f PersistentVolume.yaml

create:
	kubectl create --namespace=$(namespace) -f PersistentVolume.yaml
	helm install moodle --namespace=$(namespace) -f values.yaml stable/moodle