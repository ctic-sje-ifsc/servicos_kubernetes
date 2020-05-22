all: delete create

delete:
	kubectl delete -f mrbs_reservas.yaml
	kubectl delete -f Secret.yaml

create:
	kubectl create -f Secret.yaml
	kubectl create -f mrbs_reservas.yaml