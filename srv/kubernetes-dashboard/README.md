Baseado na documentação oficial do [kubernetes-dashboard](https://github.com/kubernetes/dashboard)

Instalar o dashboard:

```bash
$ kubectl apply -f https://raw.githubusercontent.com/kubernetes/dashboard/master/src/deploy/recommended/kubernetes-dashboard.yaml
```

Criado o ingress:
```bash
$ kubectl create -f Ingress.yaml
```

