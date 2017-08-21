#Grafana no Kubernetes
======
Utilizamos o [Helm Charts](https://github.com/kubernetes/charts) do [Grafana](https://github.com/kubernetes/charts/tree/master/stable/grafana).

Criamos o PV:
```yaml
apiVersion: v1
kind: PersistentVolume
metadata:
  name: grafana
spec:
  capacity:
    storage: 1Gi
  accessModes:
    - ReadWriteOnce
  nfs:
    server: storage1
    path: /mnt/storage/storage/kubernetes/ifsc/sje/a/saas/srv/grafana
```

o PVC:
```yaml
kind: PersistentVolumeClaim
apiVersion: v1
metadata:
  name: grafana
  labels:
    app: grafana
spec:
  accessModes:
  - ReadWriteOnce
  resources:
    requests:
      storage: 1Gi
```

Editamos o arquivo [values.yaml](values.yaml):
```yaml
    existingClaim: "grafana"
```

E executamos o comando para instalar:

```sh
helm install --name grafana -f values.yaml stable/grafana
```
