netbox
======
Este serviço foi baseado na [implementação para Docker](https://github.com/digitalocean/netbox-docker) do Netbox da [Digital Ocean](https://digitalocean.com), com a indispensável ajuda deste post  do [yteraoka](https://blog.1q77.com/author/yteraoka/): [Deploy netbox on Minikube](https://blog.1q77.com/2017/02/deploy-netbox-on-minikube/).

Os arquivos foram modificados e organizados por tipo de objeto. Para facilitar a implantação, foi criado um `Makefile` para auxiliar no processo. Apenas o arquivo `Secret.yaml`, por conter as senhas dos serviços, não consta no repositório.

Para criar um arquivo `Secret.yaml` próprio, o formato a ser usado é este:
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
Os valores em base64 podem ser criados conforme o exemplo abaixo:
```bash
echo -n senha | base64
```
onde se obtém o resultado:
```bash
c2VuaGE=
```
No exemplo, o valor `senha` foi convertido para `c2VuaGE=` e, portanto, este último é que deve ser incorporado ao arquivo, desta forma:
```yaml
...
  postgresql_password: c2VuaGE=
...
```
