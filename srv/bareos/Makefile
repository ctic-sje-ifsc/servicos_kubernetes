all: delete create

delete:
	kubectl delete -f bareos.yaml
	kubectl delete -f Secret.yaml

create:
	kubectl create -f Secret.yaml
	kubectl create -f bareos.yaml
