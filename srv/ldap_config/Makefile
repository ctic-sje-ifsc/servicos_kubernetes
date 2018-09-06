all: delete create

namespace = producao

delete:
	kubectl delete --namespace=$(namespace) -f ConfigMap.yaml

create:
	kubectl create --namespace=$(namespace) -f ConfigMap.yaml
