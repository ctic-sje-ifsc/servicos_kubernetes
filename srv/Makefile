all: delete create

delete:
	make -C kubernetes-dashboard delete
	make -C zabbix delete
	make -C wordpress delete
	make -C netbox delete
	make -C rocketchat delete
	make -C openproject delete
	kubectl delete ns awx
	helm delete --purge weave-scope

create:
	helm init --service-account tiller
	make -C zabbix create
	make -C wordpress create
	make -C netbox create
	make -C rocketchat create
	make -C openproject create
	make -C kubernetes-dashboard create
	helm install stable/weave-scope --name weave-scope --namespace producao
	echo "ATENÇÃO - O serviço AWX deve ser iniciado na mão, como descrito no readme."
