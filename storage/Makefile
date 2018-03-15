all: create

create:
	kubectl create -f rook-operator.yaml
	kubectl create -f rook-cluster.yaml
	kubectl create -f rook-pools.yaml
	kubectl create -f rook-tools.yaml

delete:
	kubectl delete -f rook-tools.yaml
	kubectl delete -f rook-pools.yaml
	kubectl delete -f rook-cluster.yaml
	kubectl delete -f rook-operator.yaml
