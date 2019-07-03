all: delete create

namespace = producao

delete:
	helm delete --purge redis-moodle
	
create:
	helm install --name redis-moodle --namespace=$(namespace) -f values.yaml stable/redis