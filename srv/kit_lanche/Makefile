all: delete create

namespace = producao

delete:
    helm delete --purge kit-lanche-phpmyadmin
	kubectl delete --namespace=$(namespace) -f Ingress.yaml
	kubectl delete --namespace=$(namespace) -f Deployment.yaml
	kubectl delete --namespace=$(namespace) -f Service.yaml
	kubectl delete --namespace=$(namespace) -f PersistentVolumeClaim.yaml
	kubectl delete --namespace=$(namespace) -f PersistentVolume.yaml
	kubectl delete --namespace=$(namespace) -f ConfigMap.yaml
	kubectl delete --namespace=$(namespace) -f Secret.yaml

create:
	kubectl create --namespace=$(namespace) -f Secret.yaml
	kubectl create --namespace=$(namespace) -f ConfigMap.yaml
	kubectl create --namespace=$(namespace) -f PersistentVolume.yaml
	kubectl create --namespace=$(namespace) -f PersistentVolumeClaim.yaml
	kubectl create --namespace=$(namespace) -f Service.yaml
	kubectl create --namespace=$(namespace) -f Deployment.yaml
	kubectl create --namespace=$(namespace) -f Ingress.yaml
	helm install --name kit-lanche-phpmyadmin --namespace $(namespace) -f phpmyadmin_values.yaml stable/phpmyadmin
