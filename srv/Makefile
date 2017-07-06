all: delete create

delete:
	make -C nginx delete
	make -C mosquitto delete
	make -C rocketchat delete
	make -C sharelatex delete
	make -C netbox delete
	make -C puppet delete

create:
	make -C puppet create
	make -C netbox create
	make -C sharelatex create
	make -C rocketchat create
	make -C mosquitto create
	make -C nginx create
