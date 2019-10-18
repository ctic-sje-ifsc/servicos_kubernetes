all: delete create

namespace = testes

delete:
	helm delete --purge mediawiki
	kubectl delete pvc --namespace=$(namespace) data-mediawiki-mariadb-0
	kubectl delete --namespace=$(namespace) -f PersistentVolume.yaml

create:
	kubectl create --namespace=$(namespace) -f PersistentVolume.yaml
	helm install --namespace=$(namespace) --name mediawiki -f values.yaml stable/mediawiki