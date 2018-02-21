
Baseado em [Rook.io distributed storage for Kubernetes](http://sonamhava.blogspot.com.br/2017/05/rookio-distributed-storage-for.html).

Ver o nome do PV criado:
```bash
kubectl get pv
```
Usar o seguinte comando para mudar o ReclaimPolicy para Retain do PV criado.
```bash
kubectl patch pv -p '{"spec": {"persistentVolumeReclaimPolicy":"Retain"}}' pvc-44ff38bf-174d-11e8-a3da-38eaa7191c92
```

```bash
helm install --name mariadbteste -f values1.yaml stable/mariadb
```
