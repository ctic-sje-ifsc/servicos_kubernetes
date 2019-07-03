# Moodle on Kubernetes
Este serviço foi baseado nas implementações [Helm Charts](https://github.com/kubernetes/charts) da [Moodle](https://github.com/helm/charts/tree/master/stable/moodle).

Estamos utilizando uma imagem baseada na bitnami/moodle:3.7.0-debian-9-r24 com poucas mudanças.
Foi adicionado suporte ao redis e alterado os parâmetros post_max_size e upload_max_filesize para 40M.