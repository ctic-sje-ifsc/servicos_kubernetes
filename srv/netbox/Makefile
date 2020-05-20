all: delete create

delete:
	kubectl delete -f netbox.yaml
	kubectl delete -f Secret.yaml

create:
	kubectl create -f Secret.yaml
	kubectl create -f netbox.yaml
