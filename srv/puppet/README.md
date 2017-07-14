#Puppet on Kubernetes
======
A ideia é nos basearmos aqui [Puppet-in-Docker with Docker Compose](https://github.com/puppetlabs/puppet-in-docker-examples/tree/master/compose) e [Running a Puppet Server on Kubernetes](https://github.com/puppetlabs/puppet-in-docker-examples/tree/master/kubernetes) e usar o [Kompose](https://github.com/kubernetes-incubator/kompose). E a partir dos arquivos configuramos para nosso ambiente.



Gerei os arquivos e deu essas mensagens:
```bash
gabriel_deepin@gabriel_deepin-pc:~/Música/puppet$ kompose convert -f docker-compose.yaml 
WARN Unsupported hostname key - ignoring          
WARN Unsupported read_only key - ignoring         
WARN Volume mount on the host "./code" isn't supported - ignoring path on the host 
WARN Volume mount on the host "./puppet/ssl" isn't supported - ignoring path on the host 
WARN Volume mount on the host "./puppet/serverdata" isn't supported - ignoring path on the host 
WARN Volume mount on the host "./puppetdb/ssl" isn't supported - ignoring path on the host 
WARN Volume mount on the host "./puppetdb-postgres/data" isn't supported - ignoring path on the host 
INFO file "puppet-service.yaml" created           
INFO file "puppetboard-service.yaml" created      
INFO file "puppetdb-service.yaml" created         
INFO file "puppetdbpostgres-service.yaml" created 
INFO file "puppetexplorer-service.yaml" created   
INFO file "puppet-deployment.yaml" created        
INFO file "puppet-claim0-persistentvolumeclaim.yaml" created 
INFO file "puppet-claim1-persistentvolumeclaim.yaml" created 
INFO file "puppet-claim2-persistentvolumeclaim.yaml" created 
INFO file "puppetboard-deployment.yaml" created   
INFO file "puppetdb-deployment.yaml" created      
INFO file "puppetdb-claim0-persistentvolumeclaim.yaml" created 
INFO file "puppetdbpostgres-deployment.yaml" created 
INFO file "puppetdbpostgres-claim0-persistentvolumeclaim.yaml" created 
INFO file "puppetexplorer-deployment.yaml" created ''''
```

