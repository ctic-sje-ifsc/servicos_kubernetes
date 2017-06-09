all: delete create

delete:
    make -C nginx delete
	make -C netbox delete

create:
	make -C netbox create
	make -C nginx create
