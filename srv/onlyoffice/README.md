# Onlyoffice no Kubernetes

Instalar Redis:
```sh
helm install --name onlyoffice-redis -f values.yaml stable/redis
```

Instalar PostgreSQL:
```sh
helm install --name onlyoffice-postgresql -f values.yaml stable/postgresql
```

Instalar RabbitMQ:
```sh
helm install --name onlyoffice-rabbitmq -f values.yaml stable/rabbitmq
```
