all: delete create

namespace = producao

delete:
	helm delete --purge rocketchat
	kubectl delete --namespace=$(namespace) -f PersistentVolume.yaml

create:
	kubectl create --namespace=$(namespace) -f PersistentVolume.yaml
	helm install --name rocketchat --namespace $(namespace) -f values.yaml stable/rocketchat