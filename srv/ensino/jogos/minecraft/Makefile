all: delete create

namespace = ensino

delete:
	helm delete --purge minecraft
	kubectl delete -f Service.yaml
	kubectl delete -f PersistentVolume.yaml

create:
	kubectl create -f PersistentVolume.yaml
	kubectl create -f Service.yaml
	helm install --name minecraft --namespace $(namespace) -f values.yaml stable/minecraft
