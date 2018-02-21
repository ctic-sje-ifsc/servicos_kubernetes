#Rocket.chat on Kubernetes
======
Utilizada a versão estável do [Helm](https://github.com/kubernetes/charts/tree/master/stable/rocketchat).
A configuração foi feita via arquivo `values.yaml`:
```yaml
image: rocket.chat:latest
imagePullPolicy: Always
config:
  SMTP_Host:
  SMTP_Port:
  SMTP_Username:
  SMTP_Password:
  From_Email:
  Jitsi_Enabled: false
  Jitsi_Domain: meet.jit.si
  Jitsi_URL_Room_Prefix: RocketChat
  Jitsi_Open_New_Window: false
  Jitsi_Enable_Channels: false
  Jitsi_Chrome_Extension:
  WebRTC_Enable_Channel: false
  WebRTC_Enable_Private: false
  WebRTC_Enable_Direct: false
host: "chat.sj.ifsc.edu.br"
mongodb:
  persistence:
    enabled: true
    storageClass: "srv-pool"
    accessMode: ReadWriteOnce
    size: 8Gi
persistence:
  enabled: true
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
