all: delete create

delete:
	kubectl delete -f zabbix.yaml
	kubectl delete -f Secret.yaml

create:
	kubectl create -f Secret.yaml
	kubectl create -f zabbix.yaml
