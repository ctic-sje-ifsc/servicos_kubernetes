all: delete create

delete:
	kubectl delete -f StorageClass.yaml
	kubectl delete -f Pool.yaml
	kubectl delete -f tools/rook-tools.yaml
	kubectl delete -f Cluster.yaml
	kubectl delete -f Namespace.yaml

create:
	kubectl create -f Namespace.yaml
	kubectl create -f Cluster.yaml
	kubectl create -f tools/rook-tools.yaml
	kubectl create -f Pool.yaml
	kubectl create -f StorageClass.yaml
