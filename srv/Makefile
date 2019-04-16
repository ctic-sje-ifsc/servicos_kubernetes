all: delete create

delete:
#	make -C kubernetes-dashboard delete
	make -C zabbix delete
	make -C wordpress delete
	make -C netbox delete
	make -C rocketchat delete
#	make -C openproject delete
#	helm delete --purge weave-scope
	make -C fogproject delete
	make -C matlab delete
	make -C mediawiki delete
	make -C mediawiki_att delete
	make -C kit_lanche delete
	make -C hugo delete
	make -C motioneye delete
	kubectl delete ns awx
	make -C ldap_config delete

create:
	make -C ldap_config create
	helm init --service-account tiller
	make -C zabbix create
	make -C wordpress create
	make -C netbox create
	make -C rocketchat create
#	make -C openproject create
#	make -C kubernetes-dashboard create
#	helm install stable/weave-scope --name weave-scope --namespace producao
	make -C fogproject create
	make -C matlab create
	make -C mediawiki create
	make -C mediawiki_att create
	make -C kit_lanche create
	make -C hugo create
	make -C motioneye create
	echo "ATENÇÃO - O serviço AWX deve ser iniciado na mão, como descrito no readme."
