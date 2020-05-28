all: delete create

delete:
	kubectl delete -f mrbs_veiculos.yaml
	kubectl delete -f Secret.yaml

create:
	kubectl create -f Secret.yaml
	kubectl create -f mrbs_veiculos.yaml