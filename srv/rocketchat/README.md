#Rocket.chat on Kubernetes
======
Utilizada a versão estável do [Helm](https://github.com/kubernetes/charts/tree/master/stable/rocketchat).
A configuração foi feita via arquivo `values.yaml`:
```yaml
image: rocketchat/rocket.chat:latest
host: chat.sj.ifsc.edu.br

config:
  SMTP_Host: smtp.ifsc.edu.br
  SMTP_Port: 465
  SMTP_Username: *******
  SMTP_Password: *******
  From_Email: *******
  Jitsi_Enabled: false
  Jitsi_Domain: meet.jit.si
  Jitsi_URL_Room_Prefix: RocketChat
  Jitsi_Open_New_Window: false
  Jitsi_Enable_Channels: false
  Jitsi_Chrome_Extension:
  WebRTC_Enable_Channel: false
  WebRTC_Enable_Private: false
  WebRTC_Enable_Direct: false

mongodb:
  mongodbRootPassword: *******
  mongodbUsername: *******
  mongodbPassword: *******
  mongodbDatabase: *******

  persistence:
    enabled: true
    storageClass: "rocketchat-mongo-database"
    accessMode: ReadWriteOnce
    size: 2Gi

persistence:
  enabled: true
  storageClass: "rocketchat-data"
  accessMode: ReadWriteOnce
  size: 10Gi

resources:
  requests:
    memory: 512Mi
    cpu: 300m

ingress:
  enabled: true
  tls: true
  annotations:
    kubernetes.io/ingress.class: "nginx"
  secretName: *******
```

E para criar a aplicação:

```bash
make -i create
```
