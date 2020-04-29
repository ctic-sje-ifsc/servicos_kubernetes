all: delete create

delete:
	kubectl delete -f isc-dhcp.yaml
	kubectl delete -f Secret.yaml

create:
	kubectl create -f Secret.yaml
	kubectl create -f isc-dhcp.yaml
