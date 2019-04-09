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
	helm install --name awx --namespace awx --set postgresqlUsername=awx,postgresPassword=XXXXX,postgresDatabase=awx,persistence.existingClaim=pvc-awx-postgresql stable/postgresql --version=1.0.0
```

Modificado as seguintes linhas do arquivo [inventory:](https://github.com/ansible/awx/blob/devel/installer/inventory)

```
kubernetes_context=kubernetes_rke
kubernetes_namespace=awx
tiller_namespace=kube-system
pg_hostname=awx-postgresql
pg_password=XXXXX
```

Depois executado o comando: 
```bash
$ ansible-playbook -i inventory install.yml
```

Deletar o ingress padrão criado:
```bash
$ kubectl delete ingress awx-web-svc -n awx
```	

Criar a chave com os certificados do https no namespace awx:
```bash
$ kubectl create -f Secret.yaml -n awx
```	

Criar o ingress:

```bash
$ kubectl create -f Ingress.yaml
```
