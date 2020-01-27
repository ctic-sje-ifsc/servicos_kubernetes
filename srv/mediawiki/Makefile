all: delete create

namespace = producao

delete:
	kubectl delete --namespace=$(namespace) -f Ingress.yaml
	kubectl delete --namespace=$(namespace) -f Service.yaml
	kubectl delete --namespace=$(namespace) -f Deployment.yaml
	helm delete memcached-wiki --namespace=$(namespace)
	kubectl delete --namespace=$(namespace) -f PersistentVolumeClaim.yaml
	kubectl delete --namespace=$(namespace) -f PersistentVolume.yaml
	kubectl delete --namespace=$(namespace) -f Secrets.yaml

create:
	kubectl create --namespace=$(namespace) -f Secrets.yaml
	kubectl create --namespace=$(namespace) -f PersistentVolume.yaml
	kubectl create --namespace=$(namespace) -f PersistentVolumeClaim.yaml
	helm install memcached-wiki --namespace=$(namespace) -f values.yaml stable/memcached
	kubectl create --namespace=$(namespace) -f Deployment.yaml
	kubectl create --namespace=$(namespace) -f Service.yaml
	kubectl create --namespace=$(namespace) -f Ingress.yaml
