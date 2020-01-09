all: delete create

namespace = testes

delete:
	helm delete memcached-moodle --namespace=$(namespace)
	
create:
	helm install memcached-moodle --namespace=$(namespace) -f values.yaml stable/memcached