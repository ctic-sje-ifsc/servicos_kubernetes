A ideia inicial é configurarmos os docker compose para nossas variáveis e usar o Kompose para migrar.

Executei o kompose convert e gerou o seguinte:

$ kompose convert -f docker-compose.yml

WARN Unsupported depends_on key - ignoring        
WARN Volume mount on the host "~/mongo-data" isn't supported - ignoring path on the host 
WARN Volume mount on the host "~/redis-data" isn't supported - ignoring path on the host 
WARN Volume mount on the host "~/sharelatex-data" isn't supported - ignoring path on the host 
INFO file "mongo-service.yaml" created            
INFO file "redis-service.yaml" created            
INFO file "sharelatex-service.yaml" created       
INFO file "mongo-deployment.yaml" created         
INFO file "mongo-claim0-persistentvolumeclaim.yaml" created 
INFO file "redis-deployment.yaml" created         
INFO file "redis-claim0-persistentvolumeclaim.yaml" created 
INFO file "sharelatex-deployment.yaml" created    
INFO file "sharelatex-claim0-persistentvolumeclaim.yaml" created
