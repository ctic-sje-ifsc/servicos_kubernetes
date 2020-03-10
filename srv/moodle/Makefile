all: delete create

namespace = producao

delete:
	helm delete moodle --namespace=$(namespace)	
	kubectl delete pvc --namespace=$(namespace) data-moodle-mariadb-0
	kubectl delete --namespace=$(namespace) -f PersistentVolume.yaml
	helm delete redis-moodle --namespace=$(namespace)


create:
	helm install redis-moodle --namespace=$(namespace) -f values-redis-moodle.yaml bitnami/redis
	kubectl create --namespace=$(namespace) -f PersistentVolume.yaml
	helm install moodle --namespace=$(namespace) -f values-moodle.yaml bitnami/moodle