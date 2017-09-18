all: delete create

delete:
	make -C nginx delete
	make -C mosquitto delete
	make -C rocketchat delete
	make -C sharelatex delete
	make -C netbox delete
	make -C puppet delete
	make -C wordpress delete
	make -C nextcloud delete
	make -C grafana delete
	make -C hugo delete
	make -C matlab delete
	make -C mediawiki delete
	make -C nyqlab delete
	make -C octave delete
	make -C onlyoffice delete
	make -C openproject delete
	make -C zabbix delete
	make -C openldap delete

create:
	make -C openldap create
	make -C zabbix create
	make -C openproject create
	make -C onlyoffice create
	make -C octave create
	make -C nyqlab create
	make -C mediawiki create
	make -C matlab create
	make -C hugo create
	make -C grafana create
	make -C nextcloud create
	make -C wordpress create
	make -C puppet create
	make -C netbox create
	make -C sharelatex create
	make -C rocketchat create
	make -C mosquitto create
	make -C nginx create
