all: delete create

delete:
	kubectl delete -f ingress.yaml
	make -C netbox delete

create:
	make -C netbox create
	kubectl create -f ingress.yaml
