# Nuvem Privada com Kubernetes

Neste repositório é descrito o projeto de migração e implementação dos serviços
para uma infraestrutura com contêineres “orquestrados” pelo
[Kubernetes](https://k8s.io).
Está sendo implementado uma nuvem privada em cima do projeto
[cticsjeifsc/coreos](https://github.com/ctic-sje-ifsc/coreos).

A implementação da estrutura Kubernetes seguiu a
[documentação oficial](https://coreos.com/kubernetes/docs/latest/getting-started.html).
As configurações do kubernetes em si estão no projeto
[cticsjeifsc/coreos](https://github.com/ctic-sje-ifsc/coreos) em cada pasta no arquivo
`cloud-config` para cada nó, como por exemplo
[coreos0](https://github.com/ctic-sje-ifsc/coreos/blob/master/coreos0/user_data).
O `coreos0`, cabe ressaltar, é o servidor API e os todos os demais são _workers_.


## Porque migrar para contêiner e Kubernetes?
* Fluxo natural da tecnologia.
* Economia de recurso/_hardware_.
* Facilidade de agregar e manter novos serviços.
* Centralização de gerência, monitoramento, administração etc.
* Serviços encapsulados podem ser movidos mais facilmente
local <=> nuvem privada <=> nuvem pública.
* Controle de versão + moderação + automação de testes = CI/CD.
* Alta disponibilidade, fácil, fácil.
* Auto escalonamento, fácil, fácil.
* Google usa há 15 anos em todos os seus serviços, bilhões de contêineres por
semana. Se eles podem, nós também pode(re)mos.


## Estrutura do projeto macro
![Projeto Macro](docs/projeto_macro_ctic.jpg)


## Serviços que podemos/queremos oferecer
![Projeto Macro](docs/servicos_possiveis.png)

Nesse repositório estamos colocando cada implementação desenvolvida.
Estamos utilizando a seguinte estratégia de atuação:
* Migrar/instalar serviços já implementados em `docker compose` ou Kubernetes.
* Migrar serviços não críticos para testar a tecnologia.
* Implementações novas importantes e críticas como fase de testes/migração.
* Implementar serviços internos para testes de estabilidade e desempenho da
tecnologia.

## Armazenamento de estados e dados

Utilizamos uma abordagem para armazenamento de estados e dados onde esses não
são salvos na mesma estrutura onde roda o Kubernetes, e sim em uma estrutura de
armazenamento centralizada. Os
[pods](https://kubernetes.io/docs/concepts/workloads/pods/pod/) montam um
armazenamento NFS e utilizam.
A implementação do storage pode ser encontrada em
[cticsjeifsc/storage](https://github.com/ctic-sje-ifsc/storage).

Podemos ver um exemplo a seguir de um
[volume persistente](https://kubernetes.io/docs/concepts/storage/persistent-volumes/)
(PV):

```yaml
apiVersion: v1
kind: PersistentVolume
metadata:
  name: netbox-postgresql-base
spec:
  capacity:
    storage: 1Gi
  accessModes:
    - ReadWriteMany
  nfs:
    server: storage1
    path: /mnt/storage/storage/kubernetes/ifsc/sje/a/saas/srv/netbox/postgresql/base
```

# Serviços Web

## _Front-end_ Nginx

A proposta básica é oferecer os serviços preferencialmente na modalidade
[SaaS](https://pt.wikipedia.org/wiki/Software_como_servi%C3%A7o) com:
1. Disponibilidade: uso de vários servidores físicos e/ou virtuais para manter 
os serviços operando sem sobressaltos.
1. Segurança: uso exclusivo de transmissão criptografada, como
[HTTPS](https://www.ssllabs.com/ssltest/analyze.html?d=projetos.sj.ifsc.edu.br&latest),
WebSocket sobre TLS, SSH e outros.
1. Desempenho: [HTTP/2](https://http2.github.io/), balanceamento de carga, cache
HTTP etc.

A grande maioria dos serviços aqui listados são baseados em HTTP.
Para garantir que todos esses atenderão aos requisitos anteriores
(independente de serem projetados para tal), existe um _front-end_ distribuído
(e escalável), o 
[srv/nginx](https://github.com/ctic-sje-ifsc/kubernetes/tree/master/srv/nginx),
de forma a padronizar o acesso.


## [Netbox](https://netbox.sj.ifsc.edu.br)

O primeiro serviço migrado foi o [netbox](https://netbox.sj.ifsc.edu.br/), que já estava rodando em container em uma VM. Pode ser encontrado em [srv/netbox](https://github.com/ctic-sje-ifsc/kubernetes/tree/master/srv/netbox).


## [Sharelatex](https://sharelatex.sj.ifsc.edu.br)

Implementamos o [sharelatex](https://sharelatex.sj.ifsc.edu.br/).
A implementação está em
[srv/sharelatex](https://github.com/ctic-sje-ifsc/kubernetes/tree/master/srv/sharelatex).


## [Rocket.Chat](https://chat.sj.ifsc.edu.br)

Finalizamos a implementação do [Rocket.chat](https://chat.sj.ifsc.edu.br/) e utilizaremos ele
em substituição do Slack, assim poderemos estar testando a estabilidade do kubernetes.
O acesso é feito com o usuário do LDAP, tanto para alunos quando para Servidores. Implementação [srv/rocketchat](https://github.com/ctic-sje-ifsc/kubernetes/tree/master/srv/rocketchat).

## [Nextcloud](https://nextcloud.sj.ifsc.edu.br)

O [Nextcloud](https://nextcloud.com) é um serviço Open Source de armazenamento e
sincronização de arquivos privados, similar ao Dropbox (proprietário).
O acesso é feito com o usuário do LDAP, tanto para alunos quando para Servidores.
Implementação do Nextcloud [srv/nextcloud](https://github.com/ctic-sje-ifsc/kubernetes/tree/master/srv/nextcloud).


## [Wordpress](https://wordpress.sj.ifsc.edu.br)

[WordPress](https://br.wordpress.org) é um aplicativo de sistema de
gerenciamento de conteúdo para web, escrito em PHP com banco de dados MySQL,
voltado principalmente para a criação de sites e blogs via web.  Implementação
do Wordpress
[srv/wordpress](https://github.com/ctic-sje-ifsc/kubernetes/tree/master/srv/wordpress).


# Serviços baseados em SSH

## OpenLDAP

Utilizada a imagem
[images/openldap](https://github.com/ctic-sje-ifsc/kubernetes/tree/master/images/openldap)
para base de usuários.
 
[![](https://images.microbadger.com/badges/image/cticsjeifsc/openldap.svg)](https://microbadger.com/images/cticsjeifsc/openldap "Get your own image badge on microbadger.com")
[![](https://images.microbadger.com/badges/version/cticsjeifsc/openldap.svg)](https://microbadger.com/images/cticsjeifsc/openldap "Get your own version badge on microbadger.com")
[![](https://images.microbadger.com/badges/commit/cticsjeifsc/openldap.svg)](https://microbadger.com/images/cticsjeifsc/openldap "Get your own commit badge on microbadger.com")
[![](https://images.microbadger.com/badges/license/cticsjeifsc/openldap.svg)](https://microbadger.com/images/cticsjeifsc/openldap "Get your own license badge on microbadger.com")

## Matlab

Utilizada a imagem
[images/matlab](https://github.com/ctic-sje-ifsc/kubernetes/tree/master/images/matlab)
para execução remota da aplicação via SSH. 
 
[![](https://images.microbadger.com/badges/image/cticsjeifsc/matlab.svg)](https://microbadger.com/images/cticsjeifsc/matlab "Get your own image badge on microbadger.com")
[![](https://images.microbadger.com/badges/version/cticsjeifsc/matlab.svg)](https://microbadger.com/images/cticsjeifsc/matlab "Get your own version badge on microbadger.com")
[![](https://images.microbadger.com/badges/commit/cticsjeifsc/matlab.svg)](https://microbadger.com/images/cticsjeifsc/matlab "Get your own commit badge on microbadger.com")
[![](https://images.microbadger.com/badges/license/cticsjeifsc/matlab.svg)](https://microbadger.com/images/cticsjeifsc/matlab "Get your own license badge on microbadger.com")

## Octave

Utilizada a imagem
[images/octave](https://github.com/ctic-sje-ifsc/kubernetes/tree/master/images/octave)
para execução remota da aplicação via SSH. 
 
[![](https://images.microbadger.com/badges/image/cticsjeifsc/octave.svg)](https://microbadger.com/images/cticsjeifsc/octave "Get your own image badge on microbadger.com")
[![](https://images.microbadger.com/badges/version/cticsjeifsc/octave.svg)](https://microbadger.com/images/cticsjeifsc/octave "Get your own version badge on microbadger.com")
[![](https://images.microbadger.com/badges/commit/cticsjeifsc/octave.svg)](https://microbadger.com/images/cticsjeifsc/octave "Get your own commit badge on microbadger.com")
[![](https://images.microbadger.com/badges/license/cticsjeifsc/octave.svg)](https://microbadger.com/images/cticsjeifsc/octave "Get your own license badge on microbadger.com")

## Nyqlab

Utilizada a imagem
[images/nyqlab](https://github.com/ctic-sje-ifsc/kubernetes/tree/master/images/nyqlab)
para execução remota da aplicação via SSH. 
 
[![](https://images.microbadger.com/badges/image/cticsjeifsc/nyqlab.svg)](https://microbadger.com/images/cticsjeifsc/nyqlab "Get your own image badge on microbadger.com")
[![](https://images.microbadger.com/badges/version/cticsjeifsc/nyqlab.svg)](https://microbadger.com/images/cticsjeifsc/nyqlab "Get your own version badge on microbadger.com")
[![](https://images.microbadger.com/badges/commit/cticsjeifsc/nyqlab.svg)](https://microbadger.com/images/cticsjeifsc/nyqlab "Get your own commit badge on microbadger.com")
[![](https://images.microbadger.com/badges/license/cticsjeifsc/nyqlab.svg)](https://microbadger.com/images/cticsjeifsc/nyqlab "Get your own license badge on microbadger.com")


# Outros Serviços

## Mosquitto

Utilizada a implementação [Mosquitto](https://mosquitto.org/) para MQTT _Broker_.

Para o serviço, que por enquanto opera apenas com protocolos MQTT v3.1 e v3.1.1,
foi criada uma imagem
[images/mosquitto](https://github.com/ctic-sje-ifsc/kubernetes/tree/master/images/mosquitto).

[![](https://images.microbadger.com/badges/image/cticsjeifsc/mosquitto.svg)](https://microbadger.com/images/cticsjeifsc/mosquitto "Get your own image badge on microbadger.com")
[![](https://images.microbadger.com/badges/version/cticsjeifsc/mosquitto.svg)](https://microbadger.com/images/cticsjeifsc/mosquitto "Get your own version badge on microbadger.com")
[![](https://images.microbadger.com/badges/commit/cticsjeifsc/mosquitto.svg)](https://microbadger.com/images/cticsjeifsc/mosquitto "Get your own commit badge on microbadger.com")
[![](https://images.microbadger.com/badges/license/cticsjeifsc/mosquitto.svg)](https://microbadger.com/images/cticsjeifsc/mosquitto "Get your own license badge on microbadger.com")
