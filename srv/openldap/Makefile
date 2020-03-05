all: delete create

delete:
	kubectl delete -f openldap.yaml
	kubectl delete -f Secret.yaml

create:
	kubectl create -f Secret.yaml
	kubectl create -f openldap.yaml
