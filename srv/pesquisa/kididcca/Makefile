all: delete create

namespace = pesquisa

delete:
	kubectl --namespace=$(namespace) delete -f Service.yaml
	kubectl --namespace=$(namespace) delete -f Deployment.yaml
	kubectl --namespace=$(namespace) delete -f PersistentVolumeClaim.yaml
	kubectl delete -f PersistentVolume.yaml

create:
	kubectl create -f PersistentVolume.yaml
	kubectl --namespace=$(namespace) create -f PersistentVolumeClaim.yaml
	kubectl --namespace=$(namespace) create -f Deployment.yaml
	kubectl --namespace=$(namespace) create -f Service.yaml
