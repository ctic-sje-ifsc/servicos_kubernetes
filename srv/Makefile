all: delete create

delete:
	make -C zabbix delete
	make -C wordpress delete
	make -C netbox delete
	make -C rocketchat delete
	make -C fogproject delete
	make -C matlab delete
	make -C quartus delete
	make -C omnet delete
	make -C mosquitto delete
	make -C kit_lanche delete
	make -C hugo delete
	make -C motioneye delete
	kubectl delete ns awx
	make -C ldap_config delete
	make -C criar_usuarios delete
	make -C cronJob_att_usuarios delete
	make -C proxmox delete

create:
	helm install rancher-stable/rancher --name rancher --namespace cattle-system --set hostname=projetos.sj.ifsc.edu.br --set ingress.tls.source=tls-rancher-ingress
	make -C proxmox create
	make -C ldap_config create
	make -C zabbix create
	make -C wordpress create
	make -C netbox create
	make -C rocketchat create
	make -C criar_usuarios create
	make -C cronJob_att_usuarios create
	make -C fogproject create
	make -C matlab create
	make -C quartus create
	make -C omnet create
	make -C mosquitto create
	make -C kit_lanche create
	make -C hugo create
	make -C motioneye create
	echo "ATENÇÃO: o serviço AWX deve ser iniciado na mão, como descrito no README.md."
