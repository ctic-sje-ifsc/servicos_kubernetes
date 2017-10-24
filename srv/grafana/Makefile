all: delete create

delete:
	kubectl delete -f Ingress.yaml --namespace=desenvolvimento
	helm delete --purge grafana --namespace=desenvolvimento
	kubectl delete -f PersistentVolumeClaim.yaml --namespace=desenvolvimento
	kubectl delete -f PersistentVolume.yaml --namespace=desenvolvimento

create:
	kubectl create -f PersistentVolume.yaml --namespace=desenvolvimento
	kubectl create -f PersistentVolumeClaim.yaml --namespace=desenvolvimento
	helm install --name grafana -f values.yaml stable/grafana --namespace=desenvolvimento
	kubectl create -f Ingress.yaml --namespace=desenvolvimento
