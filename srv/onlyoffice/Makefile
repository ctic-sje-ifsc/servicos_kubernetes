all: delete create

delete:
	kubectl delete -f Service.yaml
	kubectl delete -f Deployment.yaml
	helm delete --purge onlyoffice-rabbitmq
	helm delete --purge onlyoffice-postgresql
	helm delete --purge onlyoffice-redis
	kubectl delete -f PersistentVolumeClaim.yaml
	kubectl delete -f PersistentVolume.yaml

create:
	kubectl create -f PersistentVolume.yaml
	kubectl create -f PersistentVolumeClaim.yaml
	helm install --name onlyoffice-redis -f values_redis.yaml stable/redis
	helm install --name onlyoffice-postgresql -f values_postgresql.yaml stable/postgresql
	helm install --name onlyoffice-rabbitmq -f values_rabbitmq.yaml stable/rabbitmq
	kubectl create -f Deployment.yaml
	kubectl create -f Service.yaml
