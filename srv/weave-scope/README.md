Instalar o weave-scope:

```bash
$ helm install stable/weave-scope --name weave-scope --namespace producao
```

Faça o port-forward:

```bash
$ kubectl -n producao port-forward $(kubectl -n producao get endpoints \
weave-scope-weave-scope -o jsonpath='{.subsets[0].addresses[0].targetRef.name}') 8080:4040
```

Acesse pelo navegador:

```
http://localhost:8080
```
