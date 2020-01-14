all: delete create

namespace = producao

delete:
	helm delete redis-moodle --namespace=$(namespace)
	
create:
	helm install redis-moodle --namespace=$(namespace) -f values.yaml stable/redis