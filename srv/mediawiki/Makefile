all: delete create

delete:
	helm delete --purge mediawiki
	kubectl delete -f Ingress.yaml
	kubectl delete -f PersistentVolume.yaml

create:
	kubectl create -f PersistentVolume.yaml
	kubectl create -f Ingress.yaml
	helm install --name mediawiki -f values.yaml stable/mediawiki
