#MYSQL para disciplina de bcd29008 no Kubernetes
======
Utilizamos o [Helm Charts](https://github.com/kubernetes/charts) do [mysql](https://github.com/kubernetes/charts/tree/master/stable/mysql).

Criamos o PV:
```yaml
apiVersion: v1
kind: PersistentVolume
metadata:
  name: bcd29008
  labels:
    namespace: ensino
spec:
  capacity:
    storage: 150Mi
  accessModes:
    - ReadWriteOnce
  nfs:
    server: storage1
    path: /mnt/storage/storage/kubernetes/ifsc/sje/a/saas/srv/ensino/bcd29008
```

o PVC:
```yaml
kind: PersistentVolumeClaim
apiVersion: v1
metadata:
  name: bcd29008
  namespace: ensino
  labels:
    namespace: ensino
  labels:
    app: bcd29008
spec:
  accessModes:
  - ReadWriteOnce
  resources:
    requests:
      storage: 150Mi
```

Editamos o arquivo [values.yaml](https://github.com/kubernetes/charts/blob/master/stable/mysql/values.yaml):
```yaml
    existingClaim: "bcd29008"
```

E criamos um service:

```yaml
apiVersion: v1
kind: Service
metadata:
  labels:
    app: bcd29008
  name: bcd29008
  namespace: ensino
spec:
  externalIPs:
    - "191.36.8.4"
    - "191.36.8.5"
    - "191.36.8.6"
    - "191.36.8.7"
    - "191.36.8.8"
  ports:
    - name: mysql
      port: 13306
      protocol: TCP
      targetPort: 3306
  selector:
    app: bcd29008-mysql
  type: LoadBalancer
```

Como acessar: 
```sh
mysql -u root -h nuvem.sj.ifsc.edu.br -P 13306 -p
```
