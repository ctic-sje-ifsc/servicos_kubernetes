all: delete create

delete:
	kubectl delete -f bind9.yaml
	kubectl delete -f Secret.yaml

create:
	kubectl create -f Secret.yaml
	kubectl create -f bind9.yaml
