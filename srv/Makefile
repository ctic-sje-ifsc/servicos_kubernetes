all: delete create

delete:
	make -C zabbix delete
	make -C wordpress delete
	make -C netbox delete
	make -C rocketchat delete

create:
	make -C zabbix create
	make -C wordpress create
	make -C netbox create
	make -C rocketchat create
	echo "ATENÇÃO - O serviço AWX deve ser iniciado na mão, como descrito no readme."
	echo "ATENÇÃO - O serviço weave-scope deve ser iniciado na mão, como descrito no readme."
