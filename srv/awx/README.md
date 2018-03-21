Baseado na documentação oficial do [AWX em kubernetes.](https://github.com/ansible/awx/blob/devel/INSTALL.md#kubernetes)

Criado o namespace awx:

```bash
$ kubectl create namespace awx
```
Criado o PV e PVC para o PostgreSQL:

```bash
$ kubectl create -f PersistentVolume.yaml

$ kubectl create -f PersistentVolumeClaim.yaml
```

Instalado o [PostgreSQL](https://github.com/kubernetes/charts/tree/master/stable/postgresql) via [helm charts](https://github.com/kubernetes/charts) com o seguinte comando:

```bash
helm install --name awx --namespace awx --set postgresUser=awx,postgresPassword=XXXX,postgresDatabase=awx,persistence.existingClaim=pvc-awx-postgresql stable/postgresql
```

Modificado as seguintes linhas do arquivo [inventory:](https://github.com/ansible/awx/blob/devel/installer/inventory)

```
kubernetes_context=kubernetes_rke
awx_kubernetes_namespace=awx
pg_hostname=awx-postgresql
```

Depois executado o comando: 
```bash
$ ansible-playbook -i inventory install.yml
```
