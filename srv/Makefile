all: delete create

delete:
	make -C externos/campus-continente/bareos_sd -i delete
	make -C externos/campus-jaragua-gw/netbox -i delete
	make -C eagle -i delete
	make -C zabbix -i delete
	make -C wordpress -i delete
	make -C netbox -i delete
	make -C redis-moodle -i delete
	make -C moodle -i delete
	make -C fogproject -i delete
	make -C matlab -i delete
	make -C quartus -i delete
	make -C omnet -i delete
	make -C mosquitto -i delete
	make -C kit_lanche -i delete
	make -C hugo -i delete
	make -C motioneye -i delete
	kubectl -i delete ns awx
	make -C ldap_config -i delete
	make -C criar_usuarios -i delete
	make -C cronJob_att_usuarios -i delete
	make -C proxmox -i delete

create:
	helm install rancher-stable/rancher --name rancher --namespace cattle-system --set hostname=projetos.sj.ifsc.edu.br --set ingress.tls.source=tls-rancher-ingress
	make -C proxmox -i create
	make -C ldap_config -i create
	make -C bind9 -i create
	make -C zabbix -i create
	make -C wordpress -i create
	make -C netbox -i create
	make -C redis-moodle -i create
	make -C moodle -i create
	make -C criar_usuarios -i create
	make -C cronJob_att_usuarios -i create
	make -C fogproject -i create
	make -C matlab -i create
	make -C quartus -i create
	make -C omnet -i create
	make -C mosquitto -i create
	make -C kit_lanche -i create
	make -C hugo -i create
	make -C motioneye -i create
	make -C eagle -i create
	make -C externos/campus-continente/bareos_sd -i create
	make -C externos/campus-jaragua-gw/netbox -i create
	echo "ATENÇÃO: o serviço AWX deve ser iniciado na mão, como descrito no README.md."
