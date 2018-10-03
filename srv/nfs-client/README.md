# kubernetes nfs-client-provisioner

Baseado em https://github.com/helm/charts/tree/master/stable/nfs-client-provisioner

```
$ helm install --name nfsclient --set nfs.server=191.36.8.69 --set nfs.path=/home/public/ stable/nfs-client-provisioner
```

Para definir como default:
```
$ kubectl patch storageclass nfs-client -p '{"metadata": {"annotations":{"storageclass.kubernetes.io/is-default-class":"true"}}}'
```