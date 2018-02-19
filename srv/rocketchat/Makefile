all: delete create

delete:
	helm delete --purge rocketchat

create:
	helm install --name rocketchat -f values.yaml stable/rocketchat
