# AWX

Baseado na documentação oficial do [AWX em Kubernetes.](https://github.com/ansible/awx/blob/devel/INSTALL.md#kubernetes)

Criar o _namespace_ `awx`:

```bash
kubectl create namespace awx
```

Criar os objetos _PersistentVolume_ e _PersistentVolumeClaim_ para o PostgreSQL e _Ingress_ para o AWX:

```bash
kubectl create -f awx.yaml
```

Instalar o [PostgreSQL](https://github.com/kubernetes/charts/tree/master/stable/postgresql) via [_helm charts_](https://github.com/kubernetes/charts) com o seguinte comando:

```bash
helm install --name awx --namespace awx --set postgresqlUsername=awx,postgresPassword=XXXXX,postgresDatabase=awx,persistence.existingClaim=pvc-awx-postgresql stable/postgresql --version=1.0.0
```

Modificar as seguintes linhas do arquivo [`inventory`](https://github.com/ansible/awx/blob/devel/installer/inventory):

```bash
kubernetes_context=kubernetes_rke
kubernetes_namespace=awx
tiller_namespace=kube-system
pg_hostname=awx-postgresql
pg_password=XXXXX

task_mem_request=4
task_cpu_request=6000
rabbitmq_mem_request=2
rabbitmq_cpu_request=1000
web_mem_request=3
web_cpu_request=500
```

Depois executar o comando:

```bash
ansible-playbook -i inventory install.yml
```

Remover o _Ingress_ padrão criado pelo _helm_:

```bash
kubectl delete ingress awx-web-svc -n awx
```
