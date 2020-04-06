all: delete create

namespace = testes

delete:
	kubectl delete --namespace=$(namespace) -f Deployment.yaml	
	kubectl delete --namespace=$(namespace) -f Service.yaml
	
create:	
	kubectl create --namespace=$(namespace) -f Service.yaml	
	kubectl create --namespace=$(namespace) -f Deployment.yaml
