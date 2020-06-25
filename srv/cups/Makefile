all: delete create

delete:
	kubectl delete -f cups.yaml
	kubectl delete -f Secret.yaml

create:
	kubectl create -f Secret.yaml
	kubectl create -f cups.yaml
