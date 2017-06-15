all: delete create

delete:
	make -C nginx delete
	make -C netbox delete
	make -C sharelatex delete
	make -C rocketchat delete

create:
	make -C netbox create
	make -C nginx create
	make -C sharelatex create
	make -C rocketchat create
