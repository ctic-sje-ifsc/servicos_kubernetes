all: delete create

namespace = default

delete:
	kubectl delete --namespace=$(namespace) -f Ingress.yaml
	helm delete --purge mediawikiatt
	kubectl delete --namespace=$(namespace) -f PersistentVolume.yaml

create:
	kubectl create --namespace=$(namespace) -f PersistentVolume.yaml
	helm install --name mediawikiatt --namespace $(namespace) -f values.yaml stable/mediawiki --version=1.0.4
	kubectl create --namespace=$(namespace) -f Ingress.yaml
