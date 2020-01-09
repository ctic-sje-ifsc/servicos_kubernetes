all: delete create

namespace = testes

delete:
	helm delete redis-moodle --namespace=$(namespace)
	
create:
	helm install redis-moodle --namespace=$(namespace) -f values.yaml stable/redis