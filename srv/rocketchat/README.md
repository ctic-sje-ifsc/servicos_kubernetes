#Rocket.chat on Kubernetes
======
Utilizada a versão estável do [Helm](https://github.com/kubernetes/charts/tree/master/stable/rocketchat).
A configuração foi feita via arquivo `values.yaml`:
```yaml
image: rocket.chat:latest
imagePullPolicy: Always
host: "rocketchat.sj.ifsc.edu.br"
mongodb:
  persistence:
    enabled: true
    # StorageClass via Rook.io
    storageClass: "srv-pool"
    accessMode: ReadWriteOnce
    size: 8Gi
resources:
  requests:
    memory: 512Mi
    cpu: 1
ingress:
  enabled: true
  annotations:
    kubernetes.io/ingress.class: "tectonic"
```
E para criar a aplicação:
```bash
helm install --name rocketchat -f values.yaml stable/rocketchat
```
ou removê-la:
```bash
helm delete --purge rocketchat
```
