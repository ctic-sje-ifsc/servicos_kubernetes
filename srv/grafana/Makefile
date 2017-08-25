all: delete create

delete:
	helm delete --purge grafana
	kubectl delete -f PersistentVolumeClaim.yaml
	kubectl delete -f PersistentVolume.yaml

create:
	kubectl create -f PersistentVolume.yaml
	kubectl create -f PersistentVolumeClaim.yaml
	helm install --name grafana -f values.yaml stable/grafana
