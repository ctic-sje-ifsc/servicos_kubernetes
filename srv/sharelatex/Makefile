all: delete create

namespace = default

delete:
<<<<<<< HEAD
	#kubectl delete --namespace=$(namespace) -f Ingress.yaml
=======
>>>>>>> ecff1f92813e7579814aa9492484ea9e015b0c84
	kubectl delete --namespace=$(namespace) -f HorizontalPodAutoscaler.yaml
	kubectl delete --namespace=$(namespace) -f Service.yaml
	kubectl delete --namespace=$(namespace) -f Deployment.yaml
	kubectl delete --namespace=$(namespace) -f PersistentVolumeClaim.yaml
	kubectl delete --namespace=$(namespace) -f PersistentVolume.yaml
	kubectl delete --namespace=$(namespace) -f Secret.yaml

create:
	kubectl create --namespace=$(namespace) -f Secret.yaml
	kubectl create --namespace=$(namespace) -f PersistentVolume.yaml
	kubectl create --namespace=$(namespace) -f PersistentVolumeClaim.yaml
	kubectl create --namespace=$(namespace) -f Deployment.yaml
	kubectl create --namespace=$(namespace) -f Service.yaml
	kubectl create --namespace=$(namespace) -f HorizontalPodAutoscaler.yaml
<<<<<<< HEAD
	#kubectl create --namespace=$(namespace) -f Ingress.yaml
=======
>>>>>>> ecff1f92813e7579814aa9492484ea9e015b0c84
