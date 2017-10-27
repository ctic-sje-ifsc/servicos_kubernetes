all: delete create

delete:
	make -C ensino/ARC60808/chatbot delete
	make -C ensino/ARC60808/rotas delete
	make -C ensino/ARC60808/tradutor delete
	make -C ensino/ARC60808/tradutor delete
	make -C ensino/BCD29008 delete
	make -C chatbot delete
	make -C pesquisa/kididcca delete
	make -C mosquitto delete
	make -C rocketchat delete
	make -C sharelatex delete
	make -C netbox delete
	make -C wordpress delete
	make -C nextcloud delete
	make -C hugo delete
	make -C matlab delete
	make -C mediawiki delete
	make -C nyqlab delete
	make -C octave delete
	make -C onlyoffice delete
	make -C openproject delete
	make -C zabbix delete
	make -C openldap delete
	make -C matchbox delete
	make -C nextcloud_fpm delete

create:
	make -C nextcloud_fpm create
	make -C matchbox create
	make -C openldap create
	make -C zabbix create
	make -C openproject create
	make -C onlyoffice create
	make -C octave create
	make -C nyqlab create
	make -C mediawiki create
	make -C matlab create
	make -C hugo create
	make -C nextcloud create
	make -C wordpress create
	make -C netbox create
	make -C sharelatex create
	make -C rocketchat create
	make -C mosquitto create
	make -C pesquisa/kididcca create
	make -C ensino/ARC60808/chatbot create
	make -C ensino/ARC60808/rotas create
	make -C ensino/ARC60808/tradutor create
	make -C ensino/ARC60808/tradutor create
	make -C ensino/BCD29008 create
	make -C chatbot create
