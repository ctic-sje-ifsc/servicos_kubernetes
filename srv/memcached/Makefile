all: delete create

namespace = producao

delete:
	helm delete --purge memcached-moodle
	
create:
	helm install --name memcached-moodle --namespace=$(namespace) -f values.yaml stable/memcached