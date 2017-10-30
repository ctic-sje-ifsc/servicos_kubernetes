all: delete create

namespace = "ensino"

delete:
	kubectl --namespace=$(namespace) delete -f Service.yaml
	kubectl --namespace=$(namespace) delete -f Deployment.yaml

create:
	kubectl --namespace=$(namespace) create -f Deployment.yaml
	kubectl --namespace=$(namespace) create -f Service.yaml
