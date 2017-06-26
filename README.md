# Nuvem Privada com Kubernetes

Neste repositório é descrito o projeto de migração e implementação dos serviços para uma infraestrutura com contêineres “orquestrados” pelo Kubernetes. Está sendo implementado uma nuvem prívada em cima do projeto [coreos](https://github.com/ctic-sje-ifsc/coreos)

A implementação da estrutura kubernetes seguiu a [documentação oficial](https://coreos.com/kubernetes/docs/latest/getting-started.html). As configurações do kubernetes em si estão no projeto [coreos](https://github.com/ctic-sje-ifsc/coreos) em cada pasta no arquivo cloud-confid dos nós. Por exemplo: [aqui](https://github.com/ctic-sje-ifsc/coreos/blob/master/coreos0/user_data). O coreos0 é o master-API e os outros são workers.

## Porque migrar para container e k8s?
* Fluxo natural da tecnologia
* Economia de recurso/hardware
* Facilidade de agregar e manter novos serviços
* Centralização de gerência, monitoramento, administração...
* Serviços encapsulados podem ser movidos mais facilmente  local<=>nuvem privada<=> nuvem pública
* Controle de versão + moderação + automação de testes = CI
* Alta disponibilidade fácil
* Auto escalonamento fácil
* Google usa há 15 anos em todos os seus serviços, bilhões de containers por semana


## Estrutura do projeto macro:
![Projeto Macro](docs/projeto_macro_ctic.jpg)
