all: delete create

namespace = eclipse-che

delete:
	helm delete --purge eclipse-che
	kubectl delete -f PersistentVolume.yaml

create:
	kubectl create -f PersistentVolume.yaml
	helm upgrade --install eclipse-che --namespace $(namespace) -f values2.yaml helm/.