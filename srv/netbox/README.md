Referências
===========
- [yteraoka](https://blog.1q77.com/author/yteraoka/): [Deploy netbox on Minikube](https://blog.1q77.com/2017/02/deploy-netbox-on-minikube/)
- [Digital Ocean](https://digitalocean.com): [netbox-docker](https://github.com/digitalocean/netbox-docker)

Secret.yaml
===========
As senhas dos serviços estão no arquivo Secret.yaml, motivo pelo qual não consta no repositório.
O formato a ser usado é este:
```yaml
apiVersion: v1
kind: Secret
metadata:
  name: netbox-secret
type: Opaque
data:
  postgresql_password: <valor em base64>
  netbox_db_password: <valor em base64>
  netbox_superuser_password: <valor em base64>
  netbox_password: <valor em base64>
  netbox_secret_key: <valor em base64>
```
Os valores em base64 foram criados conforme o exemplo abaixo:
```bash
echo -n senha | base64
```
onde se obteve o resultado:
```bash
c2VuaGE=
```
No exemplo, o valor `senha` foi convertido para `c2VuaGE=` e, portanto, este último é que deve ser incorporado ao arquivo, desta forma:
```yaml
...
  postgresql_password: c2VuaGE=
...
```
